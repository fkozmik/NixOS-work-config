[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS work configuration

Here are my NixOS config files.  
Applying KISS principle.

**Note**: I am currently testing the Cosmic DE Alpha 4.

**Highlights**:

- Only **one configuration** (Should I count DEs ?) : The one that lets me work.
- **Encrypted** single **ext4** partition
- Fully **declarative** **self-hosted** stuff


## Structure

### Tree 

```tree
.
├── backup
├── Base
│   ├── base.nix
│   ├── cosmic.nix
│   ├── default.nix
│   └── gnome.nix
├── cachix
│   └── cosmic.nix
├── cachix.nix
├── configuration.nix
├── flake.lock
├── flake.nix
├── README.md
└── Users
    ├── aliases.nix
    ├── default.nix
    ├── editors.nix
    └── users.nix
```

### Baseline

- `configuration.nix`: Entrypoint
- `flake.nix`: Only the Cosmic DE build ATM.
- `Base`: Folder containing DEs and configurations subject to change
- `Users`: Folder containing personal configurations.
- `_nixos-work-hidden`: Using a private repo, as GitIgnored files aren't symlinked into the store while using Flakes.


## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Alpha 4
- Gnome 47 (Keeping it ATM, so I can keep working if Cosmic's DE Fails)
- vim and VScodium (with proprietary extensions)
- zsh
- Basic `Console` emulator from Gnome (or Cosmic FWIW) - It's good enough for me
- chrome, for the Google Workspace integration, Tab grouping...
- fastfetch
- tailscale
- docker
- thefuck, you know what I mean...
- and NixOS (Special thanks to you !)
