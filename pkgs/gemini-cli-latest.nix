{ pkgs, ... }:

let
  originalPackage = pkgs.gemini-cli;

  geminiCliLatest = originalPackage.overrideAttrs (originalAttrs: {
    pname = "gemini-cli-latest";
    version = "0.15.3";
    src = pkgs.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      rev = "v0.15.3";
      hash = "sha256-a3zigpALuuqD42n2X+5G+ol1XdSbHwLalS3ArA/cQH8=";
    };
    npmDepsHash = "sha256-KkMnxZ0G8PzIdksChVZoH5jMz8qeyGirN7URq08sz48=";
  });
in
{
  gemini-cli-latest = geminiCliLatest;
}
