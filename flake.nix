{
  description = "A flake for building a greeting";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-23.11;

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "birthday";
        src = self;
        buildPhase = "gcc -o birthday ./birthday.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin birthday";
      };

    defaultPackage.aarch64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "aarch64-linux"; };
      stdenv.mkDerivation {
        name = "birthday";
        src = self;
        buildPhase = "gcc -o birthday ./birthday.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin birthday";
      };
  };
}
