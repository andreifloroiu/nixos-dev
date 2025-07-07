# nixos-dev

[My NixOS development flake](https://nixos.wiki/wiki/flakes) with configuration files for different hosts.

## Apply to Current NixOS System

### __x86_64__

```sh
sudo nixos-rebuild switch --flake .#wsl-x86_64 --show-trace
sudo nixos-rebuild switch --flake github:andreifloroiu/nixos-dev#wsl-x86_64
```

### __ARM64__

```sh
sudo nixos-rebuild switch --flake .#wsl-aarch64 --show-trace
sudo nixos-rebuild switch --flake github:andreifloroiu/nixos-dev#wsl-aarch64
```

## Bump Versions

```sh
nix flake update
```

## Garbage Collection

Perform a cleanup from time to time:

```sh
sudo nix-collect-garbage -d
```

## Build WSL Distro From Scratch

### Use Ubuntu WSL

Install ```nix``` package manager (single-user):

```sh
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

Follow the next instruction from _install script_ then proceed.

Build into a ```result```, which is a symlink:

```sh
nix build github:andreifloroiu/nixos-dev#nixosConfigurations.wsl-aarch64.config.system.build.tarballBuilder \
        --extra-experimental-features nix-command --extra-experimental-features flakes \
        --out-link result \
    && echo "Running result..." \
    && sudo ./result/bin/nixos-wsl-tarball-builder \
    && sudo mv nixos.wsl nixos-wsl.tar.gz \
    && sudo chown andrei:users nixos-wsl.tar.gz
```

Move resulting file to host OS user folder:

```sh
mkdir  /mnt/c/Users/{{username}}/NixOS
mv nixos-wsl.tar.gz /mnt/c/Users/{{username}}/NixOS
```

Change to ```powershell``` on host OS and run:

```powershell
cd $env:USERPROFILE\NixOS\
wsl --import NixOS $env:USERPROFILE\NixOS\ nixos-wsl.tar.gz --version 2
```

## Build for Server

1. Clone this repo [andreifloroiu/nixos-dev](https://github.com/andreifloroiu/nixos-dev).

2. ```cd``` into it

3. Build an ```sd-image``` for target, e.g. 
    ```nix build '.#nixosConfigurations.jump-x86_64.config.system.build.sd-image'```
    or ```nix build '.#nixosConfigurations.jump-aarch64.config.system.build.sd-image'```

## More Read

- [seq CLI](./docs/README.seq.md)
