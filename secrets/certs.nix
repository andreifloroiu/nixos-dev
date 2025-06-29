{
  flake,
  lib,
  ...
}:

let
  flakeCertsFile = "${flake.outPath}/.env/secrets/certs/common.crt";
  flakeCertsFileString = builtins.toString flakeCertsFile;
in
{
  security.pki.certificateFiles = lib.mkIf (builtins.pathExists flakeCertsFile) [
    flakeCertsFile
  ];

  nix.extraOptions = ''
    ${lib.warn "Warning: Will add certificates from ${flakeCertsFileString} if found." ""}
  '';
}
