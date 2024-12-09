[![built with nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=41439a)](https://builtwithnix.org)

# My NixOS work configuration

Here are my NixOS config files.  
Applying KISS principle.

**Note**: I am actually preparing to use the Cosmic DE Alpha 4, a bit more modularity is coming up

**Highlights**:

- Only **one configuration** (Should I count DEs ?) : The one that lets me work.
- **Encrypted** single **ext4** partition
- Fully **declarative** **self-hosted** stuff


## Structure

- `configuration.nix`: Entrypoint, basic configs such as keymaps, fonts or networking variables; whatever configuration that is vowed to stay as it is.
- `Base`: Folder containing a tad more advanced configurations depending on what I like ATM *¯\\_(ツ)_/¯*.
  - `base.nix`: Mostly Nix Options with programs and services.
  - `${DesktopEnvironment}.nix`: GUI confs
  - `hardware-configuration.nix`: The auto-generated conf-file (Git Ignored).
- `Users`: Folder containing personal configurations.
  - `aliases.nix`: The name should tell you exactly what it does ^^
  - `editors.nix`: Where I'll define my editors (Vim and VScodium) and their extensions (if any).
  - `networking-clients.nix`: Basically my `/etc/hosts` (Git Ignored for client's privacy reasons)
  - `users.nix`: I am alone there but I need to define the packages and the security options I need somewhere, right ? 

## Tooling and applications I use

Most relevant user apps daily drivers:

- Cosmic Alpha 4
- Gnome 47 (Keeping it ATM, so I can keep working if Cosmic's DE Fails)
- vim and VScodium (with proprietary extensions)
- zsh
- Basic `Console` emulator from Gnome - I's good enough for me
- chrome, for the Google Workspace integration, Tab grouping...
- fastfetch
- tailscale
- docker
- thefuck, you know what I mean...
- and NixOS (Special thanks to you !)
