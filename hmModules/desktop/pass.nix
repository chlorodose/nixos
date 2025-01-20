{ ... }: {
  services.pass-secret-service.enable = true;
  programs.password-store.enable = true;
}