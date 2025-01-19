{ lib, ... }: 
with lib; {
  user.gpg.myKey = ../public/chlorodose_public.asc;
  user.authorizedKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKF7rjnMuwq0bB/G4dXVSZHegO06qKm4BSBREUHml7Dp chlorodose <chlorodose@chlorodose.me>\n";
}
