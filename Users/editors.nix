{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
  jetbrains.phpstorm
  jetbrains-toolbox
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
          version = "25.4.0";
          sha256 = "E/BogNtax4dkv6hlYcaRinTxr4jnVyV9hVCdkIkul9s=";
        }
        {
          name = "theme-dracula";
          publisher = "dracula-theme";
          version = "2.25.1";
          sha256 = "ijGbdiqbDQmZYVqZCx2X4W7KRNV3UDddWvz+9x/vfcA=";
        }
        {
          name = "git-graph";
          publisher = "mhutchie";
          version = "1.30.0";
          sha256 = "sHeaMMr5hmQ0kAFZxxMiRk6f0mfjkg2XMnA4Gf+DHwA=";
        }
        {
          name = "jinja";
          publisher = "wholroyd";
          version = "0.0.8";
          sha256 = "kU2uMIBChHOE76npA9u1CSJCMPHK0hj/2vasVTx9ydI=";
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
