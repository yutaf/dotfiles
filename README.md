# dotfiles

Managed with homeshick.  
NeoBundle is used as Vim plugin manger and cloned automatically by git submodule.  
https://github.com/Shougo/neobundle.vim

## Requirements
* homeshick
* Vim 7.2.051 or later

## How to initialize
- Install homeshick  
  <https://github.com/andsens/homeshick>  
  Follow the instruction on README  
- Clone dotfiles with homeshick  
`~/.homesick/repos/homeshick/bin/homeshick clone git@github.com:yutaf/dotfiles.git`
- Open new session on terminal  
You will see an output like below.  
```
Last login: Sun Mar 29 08:56:47 on ttys000
Cloning into '/Users/uetake/.antigen'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 3664 (delta 2), reused 0 (delta 0), pack-reused 3654
Receiving objects: 100% (3664/3664), 1.77 MiB | 896.00 KiB/s, done.
Resolving deltas: 100% (2191/2191), done.
Installing robbyrussell/oh-my-zsh!...
Installing arialdomartini/oh-my-git!...
Installing arialdomartini/oh-my-git-themes!...
Installing zsh-users/zsh-completions!...

☁  uetake:~
```
- Install homebrew 
- execute brew_init
`$ ~/local/bin/brew_init`
- Check instructions on `~/local/bin/brew_init`
- Install vim via homebrew
- Install vim plugins via NeoBundles  
`$ vim`  
`:NeoBundleInstall`
- (optional) Create ~/.bashrc.user.sh and edit it  
  if you have something you don't want to publish or something belonging to its own environment  
  i.e. $PATH, alias etc...
