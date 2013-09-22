use Git::Repository;
use Path::Class;
#my $git = Git::Repository->new(
#    work_tree => "https://github.com/xuting715/TestVersion.git",
#);
my $dir = dir("C:/Users/xuti/git/TestVersion"); 
#print $dir. "\n";
chdir $dir;
my $result = `git log -1 --pretty=format:"%H" `;
perl -p -i -e  's/$id$/$result/g'  date_test.txt
#open(OUTFILE, ">date_test.txt");
#   print OUTFILE ($result);