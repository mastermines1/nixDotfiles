{settings, ...}: {
  programs.git = {
    enable = true;
    userName = "Mastermines1";
    userEmail = settings.git-email;
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
