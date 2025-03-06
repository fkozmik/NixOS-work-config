{
  environment.interactiveShellInit = ''
    eval $(thefuck --alias)
    alias gs='git status'
    alias gd='git diff'
    alias gl='git log --oneline'
    alias accesscreator="~/Toolbox/vault-tuleap-dynamic-creds-helper.phar"
    alias login="evlogin && vault token renew -increment=2h"
    alias check="nix-shell --command 'make {editorconfig-checker,ansible-lint,tflint}'"

    alias rebuild="sudo nixos-rebuild switch --impure"

    function rebase {
      git fetch upstream
      git checkout main
      git rebase upstream/main
      git push --force-with-lease origin main
    }

    function enassh {
        cd ~/Documents/git/enalean-infrastructure
        rebase
        nix-shell --command "evlogin; poetry shell; return"
    }

    function go {
        if [ "$1" = "dev" ]; then 
          cd ~/tuleap
          git pull && git reset --hard HEAD
          nix-shell
        elif [ "$1" = "infra" ]; then 
          cd ~/Documents/git/enalean-infrastructure && nix-shell 
        elif [ "$1" = "git" ]; then
          cd ~/Documents/git/ && ls
        elif [ "$1" = "tools" ]; then
          cd ~/Toolbox/ && ls
        else
          echo -e "Unknown path \nKnown routes are 'infra', 'dev', 'git', 'tools'"
        fi
    }

    function logseq-commit {
        cd ~/Documents/git/Logseq
        git add . 
        git commit -m "`date +%H:%M`"
    }

    function logseq-push {
          logseq-commit
          git push origin main
    }

  '';
}
