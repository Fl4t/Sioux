#!/usr/bin/env perl

package Sioux;

# J'écris dans un fichier .pid le processus d'un fils
sub enregistrerPID {
  open(FICHIERPID, ">>lib/.pid");
  print FICHIERPID "$_[0]\n";
  close(FICHIERPID);
}

1;
