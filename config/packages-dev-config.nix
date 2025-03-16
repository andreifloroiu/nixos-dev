{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
  ];
  environment.systemPackages = with pkgs; [
    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_8_0
      sdk_9_0
    ])
    # something I need
    seq-cli
    # Spotify player TUI
    spotify-player
  ];
}
