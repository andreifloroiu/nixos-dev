final: prev: {
  gemini-cli = prev.gemini-cli.overrideAttrs (old: {
    src = prev.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v15.3";
      hash = "sha256-43ohCUqdM0quxwoN3s/3vOq4IRc+sck+BkAfqMEDq8g=";
    };
  });
}
