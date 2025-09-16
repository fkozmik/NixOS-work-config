[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS work configuration

Here are my NixOS config files.  
Applying KISS principle.

**Note**: I am currently testing the Cosmic DE Alpha.

**Highlights**:

- Only **one configuration** : The one that lets me work.
- **Encrypted** single **ext4** partition
- Fully **declarative** **self-hosted** stuff


## Structure

### Tree 

```tree
.
├── backup
├── configuration.nix
├── flake.lock
├── flake.nix
├── README.md
└── roles
    ├── aliases.nix
    ├── battery-management.nix
    ├── cosmic.nix
    ├── editors.nix
    ├── fonts.nix
    ├── gnome.nix
    ├── programs.nix
    ├── services.nix
    └── users.nix
```

### Baseline

- `configuration.nix`: Entrypoint
- `flake.nix`: Only the Cosmic DE build ATM.
- `DesktopEnvironments`: Folder containing DEs.
- `Users`: Folder containing personal configurations.
- `_nixos-work-hidden`: Using a private repo, as GitIgnored files aren't symlinked into the store while using Flakes.


## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Alpha (Gnome 47 as backup)
- vim and VScodium (with proprietary extensions)
- zsh
- Basic `Console` emulator from Cosmic - It's good enough for me
- chrome, for the Google Workspace integration, Tab grouping...
- fastfetch
- tailscale
- docker
- thefuck, you know what I mean...
- and NixOS (Special thanks to you !)
