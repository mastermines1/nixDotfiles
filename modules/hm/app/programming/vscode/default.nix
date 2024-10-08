{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscode.fhs;
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      marp-team.marp-vscode
      ms-dotnettools.csharp
    ];
  };
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  };
}
