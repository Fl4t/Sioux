#!/usr/bin/env perl
use warnings;

package Sioux;

sub enTete {
  $header = "HTTP/1.0 $_[1]\n";
  $header .= "Content-Type: $_[0];";
  $header .= " charset=utf-8\n\n";
  return $header;
}

sub enregistrerPere {
  open(FICHIERPID, ">lib/.pidpere");
  print FICHIERPID "$_[0]\n";
  close(FICHIERPID);
}

sub chargerLaConf {
  my $i;
  open(CONF, "sioux.conf");
  while (<CONF>) {
    chomp;
    @conf = split(/ /, $_);
    $ret[$i++] = $conf[$#conf];
  }
  return @ret;
}

1;
