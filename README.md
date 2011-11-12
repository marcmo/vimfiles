# vim configuration

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


# VIM cheatsheet

## Recently added

### replace in visual selection

    :s/\%Vred/blue/g

### GOTO Column

    80| -- go to the 80th column   

### move cursor beyond end of line

    set virtualedit=all

### Save a file you edited in vim without the needed permissions

    :w !sudo tee %

### display recent error messages of vim

    :mess

### go to previous/next edited file/position

    Ctrl-o
    Ctrl-i

### display lines that do not contain a pattern

    /\v^(.*Warning)@!.*$      -- will find all lines that do not include Warning

### remove ^M from windows file

    :s%/^V^M//g -- i.e. Ctrl-V,Ctrl-m

### node.js for jslint

    curl -L http://github.com/strager/node-jslint/tarball/master | tar xz --strip 1 -C .
    npm install .

in vimrc:

    augroup js
        set makeprg=jslint\ %
        set efm=%f:%l:%c:%m
    augroup END

add config file for jslint: ~/.jslint

    {
      "predef":   [ 
          "exports",
          "global",
          "process",
          "require",
          "__filename",
          "__dirname",
          "module"       
      ],
      "browser" : false,
      "devel" : false,
      "rhino" : false,
      "es5" : false, 
      "widget": false,
      "windows" : false,
      "onvar" : true
    }
### convert to match the current tab settings

    :retab

### display key mapping/binding

    :map          -- normal, visual, select and operator pending mode
    :map!         -- insert and command-line mode.
    :nmap         -- normal mode maps
    :imap         -- insert mode maps
    :vmap         -- visual and select mode maps
    :smap         -- select mode maps
    :xmap         -- visual mode maps
    :cmap         -- command-line mode maps
    :omap         -- operator pending mode maps

### edit previous file

    CTRL-6 or :e#

### install plugins using pathogen

  * create folder for bundle in .vim/bundle
  * copy content of zipfile etc. to bundle

#### when the plugin is a git repo:

    cd ~/.vim && mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

#### setting up vim in new environment:

    git clone git://github.com/marcmo/vimfiles.git ~/.vim
    ln -s ~/.vim/_vimrc_universal ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update
    
#### in vim: add helptags for new bundle

    :call pathogen#helptags  -- will create helptags in pathogen bundle folder

#### install vimballs

    :UseVimball ~/.vim/bundle/bundle-dir-name-here

### us vim from irb

  * in irb, enter: vi + Enter
  * to store file: :w myfile.rb
  * to continue irb with a file: vi 'myfile.rb' + Enter

### command line window

    q/            -- show history of search patterns
    q:            -- show history of commands
    C-f           -- switch to command line window while in command line mode

### ctags

    C-T           -- ctags, jump back from the definition
    :tn           -- next
    :tp           -- previous

### change word till

    ctu  -- change word up to character 'u' (Change To 'u')

### run vim without plugins

    vim -u "NONE" hugefile.log

### use ruby regex for string replacement

    :rubydo gsub /pattern/,'replacement'  -- Equivalent to s/pattern/replacement/g (also works on visual selections):


