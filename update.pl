#!perl
# Copyright 2012 - Double Cluepon Software Corp.
# This code is free software; you can redistribute it and/or modify it under the same terms as Perl itself

use strict;
use warnings;
use Pod::Usage;
use Getopt::Long;
use XML::LibXML;
use File::Spec::Functions qw( catdir catfile );
use File::Path qw( make_path );
use File::Copy qw( copy );
use Git::Repository;
use DateTime;
use DateTime::Format::Strptime;
use feature qw( say );

GetOptions(
    'h|help'            => \( my $help ),
    'p|pkg|package:s'   => \( my $package ),
    'm|make:s'          => \( my $make ),
    'root:s'            => \( my $root ),
    'url_root:s'        => \( my $url_root ),
);

pod2usage(0) if $help;

if ( @ARGV != 1 ) {
    pod2usage("ERROR: app.xml argument is required!");
}
my $app_file = $ARGV[0];
my ( $app_id, $app_version ) = get_app_info( $app_file );

$package    ||= $app_id . ".air";
$make       ||= $package;
$root       ||= "update";
$url_root   ||= "http://update.emeraldkingdom.com/";

my $git = Git::Repository->new( work_tree => '.' );
my @tags = $git->run( 'tag' );

my $update_folder = catdir( $root, $app_id );
if ( !-d $update_folder ) {
    make_path( $update_folder );
}
my $update_file = catfile( $update_folder, 'update.xml' );
my $update;
my $update_doc;
if ( -f $update_file ) {
    $update = parse_xml( $update_file );
    $update_doc = $update->getDocumentElement;
}
else {
    $update = XML::LibXML::Document->createDocument( '1.0', 'utf-8' );
    $update_doc = $update->createElement('update');
    $update_doc->setAttribute( 'id' => $app_id );
    $update->setDocumentElement( $update_doc );
}

# Make sure each v-tag is in the update.xml file
for my $tag ( grep { /^v/ } @tags ) {
    my ( $node ) = grep { $_->getAttribute('tag') eq $tag }
                   $update_doc->getElementsByTagName('version');
    next if $node; # Already exists, will not change

    # Get the information from git
    $git->run( checkout => $tag );
    my $log = $git->run( log => '-n1' );
    my $info = parse_git_log( $log );

    # Get information from the current app.xml file
    next unless -e $app_file; # App file may not exist yet
    my ( undef, $version_number ) = get_app_info( $app_file );

    # Create the package file
    my $package_version = $package;
    $package_version =~ s/[.]air/-$version_number.air/;
    unlink $package;
    system( 'make', $make ) and next; # If make fails, go to the next tag
    next if !-e $package; # If the package wasn't created, this version is invalid
    copy $package, catfile( $update_folder, $package_version );

    # Add the update.xml information
    $node = $update->createElement( 'version' );
    $node->setAttribute( id => $version_number );
    $node->setAttribute( tag => $tag );
    my $file_node = $update->createElement('file');
    $file_node->appendChild(
        $update->createTextNode( $url_root . $app_id . '/' . $package_version )
    );
    my $description_node = $update->createElement( 'description' );
    $description_node->appendChild( $update->createTextNode( $info->{description} ) );
    my $date_node = $update->createElement( 'date' );
    $date_node->appendChild( $update->createTextNode( $info->{date} ) );
    $node->appendChild( $file_node );
    $node->appendChild( $description_node );
    $node->appendChild( $date_node );
    say "$tag -> $node";
    $update_doc->appendChild( $node );
}

$update->toFile( $update_file );

# Restore ourselves to master
$git->run( checkout => 'master' );

sub parse_xml {
    my ( $file ) = @_;
    my $xml = XML::LibXML->new();
    return $xml->parse_file( $file );
}

sub version_to_number {
    my ( $version ) = @_;
    $version =~ s/^v//;
    my ( @parts ) = split m{[.]}, $version;
    my $format = '%d.' . ( '%03d' x (@parts-1) );
    return sprintf $format, @parts;
}

sub get_app_info {
    my ( $app_file ) = @_;
    my $app_xml = parse_xml( $app_file )->getDocumentElement;
    my $app_id  = $app_xml->getElementsByTagName('id')->[0]->textContent;
    my $app_version = $app_xml->getElementsByTagName('versionNumber')->[0]->textContent;
    return ( $app_id, $app_version );
}

sub parse_git_log {
    my ( $log ) = @_;
    my @lines = split /\n/, $log;
    my $info = {
        description => '',
        date => '',
    };
    my $in_msg = 0;
    for my $line ( @lines ) {
        if ( !$in_msg ) {
            if ( $line =~ /^Date:\s+(.+)\s*$/ ) {
                my $parser = DateTime::Format::Strptime->new(
                    pattern => '%a %b %d %T %Y %z',
                );
                my $dt = $parser->parse_datetime( $1 );
                $info->{date} = $dt->strftime('%F');
            }
            elsif ( $line =~ /^\s*$/ ) {
                $in_msg = 1;
            }
        }
        else {
            $info->{description} .= $line . "\n";
        }
    }
    return $info;
}

__END__

=head1 NAME

update.pl - Maintain the update folder for a project

=head1 USAGE

    update.pl <app.xml> [--package <package>] [--make <target>] [--root <folder>] \
        [--url_root <url>] [--git <git_folder>]
    update.pl [-h|--help]

=head1 DESCRIPTION

=head1 ARGUMENTS

=head2 app.xml

The app.xml file. Used to find the app C<id> and the C<versionNumber>.

=head1 OPTIONS

=head2 package <package.air>

The name of the package file created by the make target. Defaults to "<app_id>.air".

=head2 make <target>

The make target used to create the package file.

=head2 root <folder>

The root folder to create all the update files in.

=head2 url_root <url>

The root URL that corresponds to the C<root> folder.

=head2 help

Display the help file

=head1 UPDATE.XML FILE

The update.xml has the following format:

    <?xml version="1.0" encoding="utf-8"?>
    <update>
        <version id="0.006005" tag="v0.6.5">
            <file>http://update.example.com/package-0.6.5.air</file>
            <date>2012-07-01</date>
            <description><![CDATA[
                <p>This is the description of the release.</p>
                <ul>
                    <li>HTML is allowed inside</li>
                </ul>
            ]]></description>
        </version>
    </update>

The C<version> tag has one required attribute, C<id>, which must be the exact
value of the C<versionNumber> from the app.xml file.
