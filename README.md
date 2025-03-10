# nixos-dev

[My NixOS development flake](https://nixos.wiki/wiki/flakes) with configuration files for different hosts.

## Apply to Current NixOS System

### __x86_64__

```bash
sudo nixos-rebuild switch --flake .#wsl-x86_64 --show-trace
sudo nixos-rebuild switch --flake github:andreifloroiu/nixos-dev#wsl-x86_64
```

Bump version up and rebuild:

```bash
nix flake update \
    && sudo nixos-rebuild switch --flake .#wsl-x86_64 --show-trace
```

### __ARM64__

```bash
sudo nixos-rebuild switch --flake .#wsl-aarch64 --show-trace
sudo nixos-rebuild switch --flake github:andreifloroiu/nixos-dev#wsl-aarch64
```

Bump version up and rebuild:

```bash
nix flake update \
    && sudo nixos-rebuild switch --flake .#wsl-aarch64 --show-trace
```

## Apply to Other Distro

### __x86_64__

Under ```root```.

```bash
nix profile install "flake:home-manager#home-manager" --extra-experimental-features nix-command --extra-experimental-features flakes
sudo nix build --refresh github:andreifloroiu/nixos-dev#nixConfigurations.admin-x86_64 --extra-experimental-features nix-command --extra-experimental-features flakes
```

### __ARM64__

Under ```root```.

```bash
sudo nix build --refresh github:andreifloroiu/nixos-dev#nixConfigurations.admin-aarch64 --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Build WSL

### Use Ubuntu WSL

Install ```nix``` package manager (single-user):

```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

Follow the next instruction from _install script_ then proceed.

Build into a ```result```, which is a symlink:

```bash
nix build .#nixosConfigurations.wsl-aarch64.config.system.build.tarballBuilder \
        --extra-experimental-features nix-command --extra-experimental-features flakes \
        --out-link result \
    && echo "Running result..." \
    && sudo ./result/bin/nixos-wsl-tarball-builder \
    && sudo mv nixos.wsl nixos-wsl.tar.gz \
    && sudo chown andrei:users nixos-wsl.tar.gz
```

Move resulting file to host OS user folder:

```bash
mkdir  /mnt/c/Users/{{username}}/NixOS
mv nixos-wsl.tar.gz /mnt/c/Users/{{username}}/NixOS
```

Change to ```powershell``` on host OS and run:

```powershell
cd $env:USERPROFILE\NixOS\
wsl --import NixOS $env:USERPROFILE\NixOS\ nixos-wsl.tar.gz --version 2
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
