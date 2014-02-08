# dotfiles

Supposed to be managed with homesick  
https://github.com/technicalpickles/homesick  
Including NeoBundle as a git submodule  
https://github.com/Shougo/neobundle.vim 
### NOTICE ###
* Vim 7.2.051 or later required

## how to initialize
1. Install homesick  
  `$ gem install homesick`  
  If rbenv user  
  `$ rbenv rehash`
2. Clone  
  `$ homesick clone yutaf/dotfiles`
3. Symlink to home  
  `$ homesick symlink dotfiles`
4. Install NeoBundles  
  `$ vim`  
  `:NeoBundleInstall`
5. (optional)Create ~/.bashrc.user.sh and edit it  
  if you have something you don't want to publish  
  or which belongs to its own environment  
  i.e. $PATH, alias etc...

That's all.
