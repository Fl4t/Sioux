#!/usr/bin/env perl

package Sioux;

sub tuerLesFilsZombi {
  open(FICHIERPID, "lib/.pidfils");
  while (<FICHIERPID>) {
    $fils = waitpid($_, WNOHANG);
    if ($fils == 0) {
      $filspasmort[$i++] = $_;
    }
  }
  close(FICHIERPID);

  open(FICHIERPID, ">lib/.pidfils");
  while (@filspasmort) {
    print FICHIERPID $_;
  }
  close(FICHIERPID);
}

sub enregistrerPere {
  open(FICHIERPID, ">lib/.pidpere");
  print FICHIERPID "$_[0]\n";
  close(FICHIERPID);
}

sub enregistrerFils {
  open(FICHIERPID, ">>lib/.pidfils");
  print FICHIERPID "$_[0]\n";
  close(FICHIERPID);
}

sub chargerLaConf {
  open(CONF, "sioux.conf");
  while (<CONF>) {
    chomp;
    @conf = split(/ /, $_);
    $ret[$i++] = $conf[$#conf];
  }
  return @ret;
}

1;
