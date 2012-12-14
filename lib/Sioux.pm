#!/usr/bin/env perl
use warnings;

package Sioux;

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
