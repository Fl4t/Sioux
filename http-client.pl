#!/usr/bin/perl

if(@ARGV==2) {

    use Socket;
    socket(SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
    $adr = inet_aton ($ARGV[0]) or die ("inet_aton");
    $adr_comp = sockaddr_in("80",$adr) or die ("sockadrr_in");
    connect(SERVEUR, $adr_comp) or die ("connect");
    autoflush SERVEUR 1;
    print SERVEUR "GET /$ARGV[1] HTTP/1.0	\nHost: $ARGV[0]\n\n";
    while(<SERVEUR>){
	print $_;
    }
    close(SERVEUR);
}
