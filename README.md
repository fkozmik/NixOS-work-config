[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS work configuration

Here are my NixOS config files.
Applying KISS principle.

**Note**: This configuration targets **NixOS-WSL** (Windows Subsystem for Linux).

**Highlights**:

- Only **one configuration** : The one that lets me work.
- Running on **WSL2** via [NixOS-WSL](https://github.com/nix-community/NixOS-WSL)
- Fully **declarative**


## Structure

### Tree

```tree
.
├── configuration.nix
├── flake.lock
├── flake.nix
├── README.md
└── roles
    ├── aliases.nix
    ├── programs.nix
    ├── services.nix
    └── users.nix
```

### Baseline

- `configuration.nix`: Entrypoint
- `flake.nix`: NixOS-WSL system configuration (`skill-issue-wsl`).


## Tooling and applications I use

Most relevant user apps / daily drivers:

- vim
- zsh
- fastfetch
- tailscale
- docker
- and NixOS (Special thanks to you !)
