{ config, lib, pkgs, ... }: {
  users.users.ling = {
    isNormalUser = true;
    home = "/home/ling";
    createHome = true;
    extraGroups = [ ];
    initialHashedPassword = "$y$j9T$8ZHaqfdXUOjHN20HJcJ7H0$rqfY8BLMIDTUCuK76HHXoEitH21efkik7CH2gKiufh5";
  };
}
