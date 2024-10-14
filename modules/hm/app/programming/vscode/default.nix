{ config, lib, pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscode.fhs;
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      marp-team.marp-vscode
      ms-dotnettools.csharp
    ];
    userSettings = {
      "editor.fontFamily" = "'DejaVu Sans Mono'";
      "terminal.integrated.fontFamily" = "'DejaVu Sans Mono'";
      "workbench.colorTheme" = "Stylix";
      "workbench.sideBar.location" = "right";
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
    };
  };
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  };
}
