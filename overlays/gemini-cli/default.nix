final: prev: {
  gemini-cli = prev.gemini-cli.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v0.15.3";
      # Run `nix flake prefetch github:google-gemini/gemini-cli/v0.15.3`
      hash = "sha256-aa5ca13ef9e425ca0f895d6d7466591a7e9d96e7";
    };
  });
}
