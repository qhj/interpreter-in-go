{
  description = "A Nix-flake-based Go development environment";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self , nixpkgs ,... }:
  let
    system = "x86_64-linux";
  in {
    devShells."${system}" = {
      default =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell {
        packages = with pkgs; [
          fish
          go
        ];

        shellHook = with pkgs; ''
          exec fish
        '';
      };
    };
  };
}