{ pkgs, ... }:

{
  services.openssh.authorizedKeys.keys = [
    builtins.readFile ../.env/secrets/public-keys/hq-ssh-ca.pub
  ];
  security.pki.trustedSystemCertificates = [
    pkgs.writeTextFile {
      name = "hq-ca-chain.crt";
      destination = "/etc/ssl/certs/hq-ca-chain.crt";
      text = builtins.readFile ../.env/secrets/certs/hq-ca-chain-public.crt;
    }
  ];
}
