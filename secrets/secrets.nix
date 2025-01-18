let
  cl-server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoG1njuBcqcylds7HIrSUUeqxiyJUUI+pduTVUJYXzr";
in
  {
    "cf-ddns.age".publicKeys = [cl-server];
  }