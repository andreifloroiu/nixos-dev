{
  pkgs,
  ...
}:
{
  imports = [
    ./base.nix
  ];
  environment.systemPackages = with pkgs; [
    # Azure CLI... needed, not wanted
    #azure-cli
    # .NET SDK packages
    (
      with dotnetCorePackages;
      combinePackages [
        sdk_8_0
        sdk_9_0
      ]
    )
    # Analyse docker images
    dive
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
    # lazy SQL
    lazysql
    # NodeJS
    nodejs_22
    #nodejs_20
    #nodejs_18
    nodePackages.node-gyp
    nodePackages.node-gyp-build
    # HTTP load generator
    oha
    # For certificates
    openssl
    python3
    python3Packages.virtualenv
    # delta file sync
    rsync
    # something I need
    seq-cli
    # tldr any command instead of man, e.g. tldr fd
    tldr
    # HTTP load testing tool
    vegeta
    # NodeJS package manager
    yarn
  ];
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnetCorePackages.sdk_8_0}";
    MC_SKIN = "dark";
  };
  #nixpkgs.config.permittedInsecurePackages = [
  #  "dotnet-sdk-6.0.428"
  #];
}
