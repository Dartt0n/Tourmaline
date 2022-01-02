#INFO: Path
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin


#INFO: Tools initialization
zoxide init fish | source
starship init fish | source

#INFO: Functions
function fish_greeting
  pfetch
  td list
  echo
end

function cic
    xclip -sel clip -t image/png -o > /tmp/image.png
    convert /tmp/image.png -channel RGB -negate /tmp/dimage.png
    rm /tmp/image.png
    xclip -sel clip -t image/png /tmp/dimage.png
    rm /tmp/dimage.png
end


#INFO: Aliases
alias ls "exa -FhalSg --icons"
alias cd z
alias ports "netstat -lntup"

eval (ssh-agent -c) > /dev/null
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
