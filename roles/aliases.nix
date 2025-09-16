{
  environment.interactiveShellInit = ''
    eval $(thefuck --alias)
    alias gs='git status'
    alias gd='git diff'
    alias gl='git log --oneline'
    alias accesscreator="~/Toolbox/vault-tuleap-dynamic-creds-helper.phar"
    alias login="evlogin && vault token renew -increment=2h > /dev/null"
    alias check="nix-shell --command 'make {editorconfig-checker,ansible-lint,tflint,scan-secrets}'"

    alias rebuild="sudo nixos-rebuild switch --impure --flake /home/fkozmik/NixOS-work-config/#skill-issue"

    function rebase {
      git fetch upstream
      git checkout main
      git rebase upstream/main
      git push --force-with-lease origin main
    }

    function go {
        if [ "$1" = "dev" ]; then 
          cd ~/tuleap
          git pull && git reset --hard HEAD
          nix-shell
        elif [ "$1" = "infra" ]; then 
          cd ~/Workspace/enalean-infrastructure && nix-shell --command "login; return"
        elif [ "$1" = "git" ]; then
          cd ~/Workspace/ && ls
        elif [ "$1" = "tools" ]; then
          cd ~/Toolbox/ && ls
        else
          echo -e "Unknown path. \nKnown routes are 'infra', 'dev', 'git', 'tools'"
        fi
    }

    function logseq-commit {
        cd ~/Workspace/Logseq
        git add . 
        git commit -m "`date +%H:%M`"
    }

    function logseq-push {
          logseq-commit
          git push origin main
    }

  '';
}
