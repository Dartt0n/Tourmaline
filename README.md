# Some Super Cool Linux Build (may be)

This guide is a little bit mess

TODO:

 [ ] Sort everything
 [ ] Better english
 [ ] Install scripts 

## Choosing the base

It must be
- arch based (I can not live without AUR)
- minimal
- a little bit preconfigured
- not with "full gui" desktop enviroment (not with Gnome, Kde, or smth like that)
So I choose ArchCraft

## Installing all I need

### kitty

#### Desc
awesome and nise terminal emulator

#### Install
```sh
yay -S kitty
```

#### Configure
`kitty.conf`:

```
include current-theme.conf

font_size 20
font_family Hurmit Nerd Font Mono
font_features FiraCode +liga

background_opacity 0.95

bold_font             auto
italic_font           auto
bold_italic_font      auto
force_ltr yes
disable_ligatures never
sync_to_monitor yes
visual_bell_duration 0.0
enable_audio_bell no
shell .
close_on_child_death no
allow_remote_control yes
term xterm-256color
```

`current-theme.conf`:
```
background            #131313
foreground            #d6dae4
cursor                #b9b9b9
selection_background  #eb6eb7
color0                #1f1f1f
color8                #d6dae4
color1                #f71118
color9                #de342e
color2                #2cc55d
color10               #1dd260
color3                #ecb90f
color11               #f2bd09
color4                #2a84d2
color12               #0f80d5
color5                #4e59b7
color13               #524fb9
color6                #0f80d5
color14               #0f7cda
color7                #d6dae4
color15               #ffffff
selection_foreground  #131313
```
### nord fonts

#### Desc
set of nice fonts with gliphs

#### Install
```sh
yay -S nerd-fonts-complete
```
### fira code
#### Desc
programmer font with ligatures
#### Install
```sh
yay -S ttf-fira-code
```
### Starship
beautiful configurable shell prompt
#### Install
```sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```
#### Configure
Firstly configure shell
```sh
eval "$(starship init bash)" # bash
eval "$(starship init zsh)" # zsh
starship init fish | source # fish
```

`starship.toml`:
```

```

### Some beauties
#### Install
```sh
yay -S pfetch lolcat
```
### fish shell
#### Desc
awesome shell with autocompletions and highlighting
#### Install
```sh
yay -S fish
```
#### Configure
Create config file
```sh
mkdir ~/.config/fish
touch ~/.config/fish/config.fish
nvim ~/.config/fish/config.fish
```
Write down
```
#INFO: Path
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

#INFO: Tools initialization
zoxide init fish | source
starship init fish | source

#INFO: Functions
function fish_greeting
  pfetch | lolcat -S 8
end

#INFO: Aliases
```
NOTE: as I will use fish shell only as interactive shell, it is better to modify bash/zsh to drop into fish
Add to the end of .bashrc/.zshrc
```sh
exec fish
```
### tldr
nice help tool
```sh
yay -S tldr
```

### ripgrep
Better then grep
```sh
yay -S ripgrep
```

### code
a really cool universal code editor
```sh
yay -S visual-studio-code-bin
```

### zathura
best pdf viewer for linux
```sh
yay -S zathura
```

### rsync
overkill copy tool
```sh
yay -S rsync
```

### rust
best programming language
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

dont forget to update your path
```
fish_add_path $HOME/.cargo/bin # for fish
PATH=~/.cargo/bin:$PATH # for zsh and bash
```


# List of cli
* `glow` - Awesome preview markdown in terminal
* `pfetch` - Cool fetch program
* `lolcat` - Colorizer for terminal
* `zathura` - Minimal pdf viewer (with dark themes configuration)
* `zipgrep` - Like grep, but better
* `fzf` - Its FZF!
* `bat` - cat/less/more but better
* `rsync` - local/network copy with progress bar
* `fish` - Cool shell
* `starship` - Beautiful configurable cross-shell prompt
* `xclip` - Manage clipboard from terminal
* `zioxide` - Fast cd
