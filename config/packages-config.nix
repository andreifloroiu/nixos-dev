{ pkgs, ... }:

{
  # Some packages were inspired from here
  # https://itnext.io/essential-cli-tui-tools-for-developers-7e78f0cd27db
  environment.systemPackages = with pkgs; [
    # Azure CLI... needed, not wanted
    azure-cli
    # Github CLI
    gh
    # GCP CLI
    google-cloud-sdk
    # ping but with graph
    gping
    # kubectl
    kubectl
    # lazy but for Docker
    lazydocker
    # HTTP load generator
    oha
    # For certificates
    openssl
    python3
    python3Packages.virtualenv
    # delta file sync
    rsync
    # tldr any command instead of man, e.g. tldr fd
    tldr
    # HTTP load testing tool
    vegeta
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
    MC_SKIN = "dark";
  };
 }
