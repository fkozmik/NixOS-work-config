{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
    vim
    (vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = with vscode-extensions; [
          bbenoist.nix
          ms-azuretools.vscode-docker
          ms-python.python
          ms-vscode-remote.remote-ssh
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "Ansible";
            publisher = "redhat";
            version = "24.8.3";
            sha256 = "8DlOB3bog/VeW5YAU2DQhlkvCf+3JqVJNbPJJJWYjI4=";
          }
          {
            name = "theme-dracula";
            publisher = "dracula-theme";
            version = "2.25.0";
            sha256 = "02aTnAvUJ/uCMNtjoCSQDlqwq5TwMwsEqWf/XRYnzT8=";
          }
          {
            name = "git-graph";
            publisher = "mhutchie";
            version = "1.30.0";
            sha256 = "sHeaMMr5hmQ0kAFZxxMiRk6f0mfjkg2XMnA4Gf+DHwA=";
          } 
          {
            name = "mac-vim-ron";
            publisher = "Dashiell";
            version = "0.0.1";
            sha256 = "WCh9Kam2McWmx668or6hD2ZwhzgikB6OXPKnZRDHRt0=";
          } 
          {
            name = "vscode-workspace-explorer";
            publisher = "tomsaunders";
            version = "1.5.0";
            sha256 = "E7QVsUTLc3PP+xztFZlv5vUYpMR8ds+0VRZkg0Y6dAA=";
          }
          {
            name = "vscode-yaml";
            publisher = "redhat";
            version = "1.15.0";
            sha256 = "NhlLNYJryKKRv+qPWOj96pT2wfkiQeqEip27rzl2C0M=";
          }
        ];
      })
    ];
}
