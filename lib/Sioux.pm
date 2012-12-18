#!/usr/bin/env perl
use strict; # norme d'évaluation des termes plus strict
use warnings; # warnings suplémentaires

package Sioux;

sub code {
  my @httpErrorCodes;
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
  my @content;
  return $debut.'200 OK'.$milieu.'The request is OK'.$fin if $_[0] eq '200';
  return $debut.'403 Forbidden'.$milieu.'Access is forbidden to the requested page'.$fin if $_[0] eq '403';
  return $debut.'404 Not Found'.$milieu.'The server can not find the requested page'.$fin if $_[0] eq '404';
  return $debut.'404 Not Found'.$milieu.'The server can not find the requested page'.$fin if $_[0] eq '404';
  return $debut.'400 Bad Request'.$milieu.'The server did not understand the request'.$fin if $_[0] eq '400';
  return $debut.'505 HTTP Version Not Supported'.$milieu.'The server does not support the http protocol'.$fin if $_[0] eq '503';
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
