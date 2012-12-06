#!/usr/bin/env perl

package subroutine;

# J'écris dans un fichier .pid le processus d'un fils
sub enregistrerPID {
  open(FICHIERPID, ">lib/.pid");
  print FICHIERPID $_;
  close(FICHIERPID);
}

1;
