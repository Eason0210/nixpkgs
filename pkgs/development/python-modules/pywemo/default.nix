{ lib
, buildPythonPackage
, fetchFromGitHub
, ifaddr
, lxml
, poetry-core
, pytest-vcr
, pytestCheckHook
, pythonOlder
, requests
, urllib3
}:

buildPythonPackage rec {
  pname = "pywemo";
  version = "0.6.8";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "sha256-4EvS1f9l1HXf+b/t4NavIxUsBkFomEqZgpumM+O8RZg=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    ifaddr
    requests
    urllib3
    lxml
  ];

  checkInputs = [
    pytest-vcr
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "pywemo"
  ];

  meta = with lib; {
    description = "Python module to discover and control WeMo devices";
    homepage = "https://github.com/pywemo/pywemo";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
