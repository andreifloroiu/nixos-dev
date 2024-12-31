# nixos-dev

[My NixOS development flake](https://nixos.wiki/wiki/flakes) with configuration files for different hosts.

## Apply to Current System

### __x86_64__

```bash
sudo nixos-rebuild switch --flake .#wsl-x86_64 --show-trace
```

Bump version up and rebuild:

```bash
nix flake update \
    && sudo nixos-rebuild switch --flake .#wsl-x86_64 --show-trace
```

### __ARM64__

```bash
sudo nixos-rebuild switch --flake .#wsl-aarch64 --show-trace
```

Bump version up and rebuild:

```bash
nix flake update \
    && sudo nixos-rebuild switch --flake .#wsl-aarch64 --show-trace
```

## Build WSL Tarball

Build into a ```result```, which is just a symlinked directory:

```bash
nix flake update \
    && nix build .#nixosConfigurations.wsl-aarch64.config.system.build.tarballBuilder \
        --extra-experimental-features nix-command --extra-experimental-features flakes \
        --out-link result \
    && sudo ./result/bin/nixos-wsl-tarball-builder
```

## Update Versions

To update package versions to latest:

```bash
nix flake update
```

## Cleanup

Perform a cleanup from time to time:

```bash
sudo nix-collect-garbage -d
```
