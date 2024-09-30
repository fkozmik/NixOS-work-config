{
  environment.interactiveShellInit = ''
    alias gs='git status'
    alias gd='git diff'
    alias gl='git log --oneline'

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

    alias gogit="cd ~/Documents/git/ && ls"

    alias godev="cd ~/tuleap && git pull && git reset --hard HEAD && nix-shell"


    function logseq-commit {
        cd ~/Documents/git/Logseq
        git add . 
        git commit -m "`date +%H:%M`"
    }

    function logseq-push {
            logseq-commit
            git push origin main
    }

    alias accesscreator="~/vault-tuleap-dynamic-creds-helper.phar" #--lease-ttl-increment=2h"

    alias tsnodeup="sudo tailscale set --exit-node=100.101.59.148 --accept-routes"

    alias tsup="sudo tailscale up --exit-node= --accept-routes"

  '';
}
