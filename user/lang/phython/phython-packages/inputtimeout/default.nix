{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "inputimout";
  version = "1.0.4";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "edeca741dea2d54aca568fa23740288c3fe86c0f3ea700344571e9ef14a7cc1a";
  };
}
