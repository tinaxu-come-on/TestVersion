use Git::Repository;
use Path::Class;
#my $git = Git::Repository->new(
#    work_tree => "https://github.com/xuting715/TestVersion.git",
#);
my $dir = dir("C:/Users/xuti/git/TestVersion"); 
#print $dir. "\n";
chdir $dir;
my $gitid = `git log -1 --pretty=format:"%H" `;

#open(OUTFILE, ">date_test.txt");
# print OUTFILE ($result);

open FILE1,"esngov.jsp" ;    
my @new=<FILE1>;
my $result = join '', @new;
$result =~ s/gitid/gitid$gitid/gis;
close FILE1;
 
open FILE2,">esngov.jsp" ;  
print  FILE2 $result;
close FILE2;
