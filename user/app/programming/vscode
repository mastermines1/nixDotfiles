{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      marp-team.marp-vscode
      ms-dotnettools.csharp
    ];
  };
}
