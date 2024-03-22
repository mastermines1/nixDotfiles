{ pkgs, ... }:

{
  # Python packages
  home.packages = with pkgs.python3Packages; [
    # Dependencies
    pip
    pipx
    pygments
    pydantic
    platformdirs

    # Applications
    # (buildPythonPackage {
    #   pname = "";
    #   version = "";
    #   src = pkgs.fetchPypi {
    #     pname = "";
    #     version = "";
    #     sha256 = "";
    #   };
    #   propagatedBuildInputs = [
    #     # Dependencies
    #   ];
    #   doCheck = false;
    # })

  ];
}
