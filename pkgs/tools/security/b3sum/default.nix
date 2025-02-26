{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "b3sum";
  version = "1.2.0";

  src = fetchCrate {
    inherit version pname;
    sha256 = "sha256-v6OCUXes8jaBh+sKqj1yCNOTb1NQY/ENGzKf5XWGZ3w=";
  };

  cargoSha256 = "sha256-y5QVgu716p8TFoEeWIzX9aJWeT3FKwlh5vUQkKR6pdE=";

  meta = {
    description = "BLAKE3 cryptographic hash function";
    homepage = "https://github.com/BLAKE3-team/BLAKE3/";
    maintainers = with lib.maintainers; [ fpletz ivan ];
    license = with lib.licenses; [ cc0 asl20 ];
  };
}
