use Git::Repository;
use Path::Class;
#my $git = Git::Repository->new(
#    work_tree => "https://github.com/xuting715/TestVersion.git",
#);
my $dir = dir("C:/Users/xuti/git/TestVersion"); 
#print $dir. "\n";
chdir $dir;
my $result = `git log -1 --pretty=format:"%H" `;
print $result;