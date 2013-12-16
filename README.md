# dotfiles

This is managed with homesick  
https://github.com/technicalpickles/homesick  
Including NeoBundle as a git submodule  
https://github.com/Shougo/neobundle.vim 
### NOTICE ###
* Fix `PATH` in home/.bashrc.linux.sh, home/.bashrc.mac.sh as your environment
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

That's all.
