#!perl -w

=head1 Info
Please find in-line a simple re-entrant perl script that generates a list
of passwords from an input supplied on the command line. The script will
generate on a new line for every variation of the input word. The number of
new words created is based on the characters the script is allowed to
replace within the word. It also adds by default capitals.

For example if the script's table has only the following entry in the %leet
table:

'a' => '4'

then the script will take the word given on its command line and generate
list where any 'a' in the word are replaced with either 'a', 'A' or '4'
therefore passing the word 'password' to the script will return the
following variants:

password
pAssword
p4ssword

please feel free to alter the default table of characters to include
variants for your locale e.g. adding � for e etc

The script is supplied as is without warranty and only released for use in
auditing where you have permission. I hope you find the script useful and I
welcome any feedback
===================================================================================================
=cut

my %leet = (
    a   => [qw( a 4 /-\ @ A )],
    b   => [qw ( b |3 6 B )],
    c   => [qw! c ( < [ C !],
    d   => [qw! d D !],
    e   => [qw( e 3 E )],
    f   => [qw( f F )],
    g   => [qw( g 6 G )],
    h   => [qw! h |-| )-( H !],
    i   => ['i', '!' ,"1", "I" ],
    j   => ['j', "J" ],
    k   => [qw( k |< |c ]{ K )],
    l   => [ 'l', "1", "|", "L" ],
    m   => [ 'm', "|V|", "|\\/|", "M" ],
    n   => ["|\\|", "n", "N"],
    o   => [ 'o', "0", "O"],
    p   => [ 'p', "P", "9"],
    q   => [ 'q', "Q"],
    r   => [ 'r', "R"],
    s   => [ "5", "Z" ,"s", "S"],
    t   => [ "7", "+","t","T" ],
    u   => [qw( u \_/ U )],
    v   => [qw( v \/ V )],
    w   => [qw( vv `// w W)],
    'x' => ['x', 'X'],
    'y' => ['j', '`/', 'y', 'Y'],
    z   => ["2", 'z','Z'],
);

my $password = <>;
chomp $password;

my @passwords;
my @l=split //, lc $password;

my $len = length $password;
my $p="";

sub variants
{
my $col = shift;
 my $ind = shift || "";
my $org = "";
if ($col && $col < $len)
 {
$org=$ind;
}

if ($col >= $len )
{
#print "\n";
 push @passwords,$p;
$p="";
return;
 }
unless ( defined $leet{$l[$col]}[0] )
        {
                 $leet{$l[$col]}[0] = $l[$col]; # we don't have a match in
leet table so pass it through
         }
 for  ( my $k=0; $k<scalar @{$leet{$l[$col]}} ; $k++)
{
if ($col +1==$len)
 {
# print "$org$leet{$l[$col]}[$k]";
 $p.="$org$leet{$l[$col]}[$k]";
}
variants($col+1, "$org$leet{$l[$col]}[$k]");
 }
}
variants (0);
foreach (@passwords)
{
print "$_\n";
}

