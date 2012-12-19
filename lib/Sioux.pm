#!/usr/bin/env perl
use strict; # norme d'évaluation des termes plus strict
use warnings; # warnings suplémentaires

package Sioux;

sub code {
  return '200 OK' if $_[0] eq '200';
  return '403 Forbidden' if $_[0] eq '403';
  return '404 Not Found' if $_[0] eq '404';
  return '505 HTTP Version Not Supported' if $_[0] eq '505';
  return '400 Bad request' if $_[0] eq '400';
}

sub contentPage {
  my $debut = '<html><head><title>';
  my $milieu = '</title></head><body><h1>';
  my $fin = '</h1></body></html>';
  return $debut.code('403').$milieu.'Access is forbidden to the requested page'.$fin if $_[0] eq '403';
  return $debut.code('404').$milieu.'The server can not find the requested page'.$fin if $_[0] eq '404';
  return $debut.code('505').$milieu.'The server does not support the http protocol'.$fin if $_[0] eq '505';
  return $debut.code('400').$milieu.'The server did not understand the request'.$fin if $_[0] eq '400';
}

sub enTete {
  my $header = "HTTP/1.0 $_[1]\n";
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
  my @ret;
  my @conf;
  open(CONF, "sioux.conf");
  while (<CONF>) {
    chomp;
    @conf = split(/ /, $_);
    $ret[$i++] = $conf[$#conf];
  }
  return @ret;
}

1;
