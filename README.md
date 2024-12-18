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

- `configuration.nix`: Entrypoint, basic configs such as keymaps, fonts or networking variables; whatever configuration that is vowed to stay as it is.
- `flake.nix`: Only the Cosmic DE Flake ATM.
- `flake.lock`: //
- `Base`: Folder containing a tad more advanced configurations depending on what I like ATM *¯\\_(ツ)_/¯*.
  - `base.nix`: Mostly Nix Options with programs and services.
  - `${DesktopEnvironment}.nix`: GUI confs
- `Users`: Folder containing personal configurations.
  - `aliases.nix`: The name should tell you exactly what it does ^^
  - `editors.nix`: Where I'll define my editors (Vim and VScodium) and their extensions (if any).
  - `users.nix`: I am alone there but I need to define the packages and the security options I need somewhere, right ? 
- `_nixos-work-hidden`: Using a private repo, as GitIgnored files aren't symlinked into the store while using Flakes.
  - `hardware-configuration.nix`: The auto-generated conf-file.
  - `networking-clients.nix`: Basically my `/etc/hosts`.

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

## Incoming Changes

Most relevant change incoming is basing most of my conf in a Flake or modularize it 
*just* enough to keep this repo working on my work Macbook Pro as well.
