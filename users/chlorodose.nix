{ lib, ... }: 
with lib; {
  user.gpg.myKey = ../public/chlorodose_public.asc;
}
