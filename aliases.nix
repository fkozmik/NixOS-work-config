{
  environment.interactiveShellInit = ''
    alias gs='git status'
    alias gd='git diff'
    alias gl='git log --oneline'
    alias gpf='git push --force-with-lease'
    alias gogit="cd ~/Documents/git/ && ls"
    alias accesscreator="~/vault-tuleap-dynamic-creds-helper.phar --lease-ttl-increment=2h"
    alias login="evlogin && vault token renew -increment=2h"

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

    function godev {
          cd ~/tuleap
          git pull
          git reset --hard HEAD
          nix-shell
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
