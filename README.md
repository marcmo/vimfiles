## vim configuration

this repository contains configurations for linux,mac and windows

## setting up vim in new environment:

    git clone git://github.com/marcmo/vimfiles.git ~/.vim
    ln -s ~/.vim/_vimrc_universal ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

in vim:

    :pathogen#helptags  -- will create helptags in pathogen bundle folder

## usage of pathogen for plugins

### install vimballs

in vim:

    :UseVimball ~/.vim/bundle/bundle-dir-name-here

### when the plugin is a git repo

    cd ~/.vim && mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."


