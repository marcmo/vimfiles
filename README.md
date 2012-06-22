# vim configuration

this repository contains configurations for linux,mac and windows

## setting up vim in new environment:

    git clone git://github.com/marcmo/vimfiles.git ~/.vim

**linux**: `echo -e "source ~/.vim/_vimrc_universal\\nsource ~/.vim/_vimrc_linux" > ~/.vimrc`

**macos**: `echo -e "source ~/.vim/_vimrc_universal\\nsource ~/.vim/_vimrc_mac" > ~/.vimrc`

**windows**: `echo -e "source ~/.vim/_vimrc_universal\\nsource ~/.vim/_vimrc_windows" > ~/.vimrc`

    cd ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

in vim:

    :BundleInstall -- will install all additional plugins

## usage of pathogen for plugins

### install vimballs

in vim:

    :UseVimball ~/.vim/bundle/bundle-dir-name-here

### when the plugin is a git repo

    cd ~/.vim && mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

---

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

### display vim runtime information

    :mess     -- display recent error messages of vim
    :reg      -- display contents of all registers

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

# Other useful things

## surround plugin

    csw'          -- surround word with '
    yssb or yss)  -- wrap the entire line in parentheses
    cs"'          -- change from "xyz" to 'xyz'
    cs'<q>        -- change from 'xyz' to <q>xyz</q>
    cst'          -- change from <q>xyz</q> to 'xyz'

## external filters

    :!rake -T       -- show all rakefile targets
    :%!filter       -- put whole file through filter  (e.g. :%!sort)
    :!filter        -- put (visual) selection through filter   (for reversing lines looks like this: '<,'>!tac )
    :,!command      -- replace current line with command output  
    !!sh<cr>        -- execute line (e.g. "date") in shell and replace with result: (equivalent to :r!date) 
    map <f9> :w<CR>:!python %<CR>   -- run current file with external program 
    :%!nl

## capture output in register (e.g. :history)

    :redir @a       -- redirect output of a command to register
    :set all        -- command that has some output
    :redir END

## vi as command line editor:

* in e.g. .bashrc: set -o vi
* on command line: esc to normal mode, v drops into vi

## undo/redo

    u                       -- Undo the last action.
    U                       -- Undo all the latest changes that were made to the current line
    Ctrl + r                -- Redo
    'g+' and 'g-'           -- go "back in time"
    ':earlier' and ':later' -- take a time descriptor like 7m or 1h
    :undo n                 -- jump to specific nodes in the tree using
                            -- (n is a number of an action, all actions are numbered sequentially as you do them.)
    :undolist               -- look up the number of the actions on the leaves of the undo tree via.
                            -- This will let you jump between branches easily.
                            -- You can then use u and Ctrl-R to move up and down that branch.

## search and replace

    :%s/,/\r/g            -- replace "," with newlines (nice!)
    :g/pattern/p          -- print all lines that contain "pattern".
    :g/pattern            -- is equivalent.
    :v/pattern/d          -- filter text: delete all lines that do not contain a pattern, e.g. use with regex mode \v: :v/\v\s(cpp|h)/d
    :%s/foo/<c-r>a/g      -- Replace each occurrence of 'foo' with the contents of register 'a'. (useful if the register contains many lines of text)
    :%s/foo/\=@a/g        -- Replace each occurrence of 'foo' with the contents of register 'a'. (useful if the register contains many lines of text) 
    :%s//bar/g            -- Replace each match of the last search pattern with 'bar'. 
    /\(yes\|no\)          -- regex OR operator, finds yes or no
    :g/gladiolli/#        -- display with line numbers (YOU WANT THIS!)
    :vmap // y/<C-R>"<CR> -- search for visually highlighted text
    /fred\_s*joe/         -- multiline search (any whitespace including newline)
    :%s/search/replace/gc -- When you run this search, Vim will give you a prompt that looks something like this: replace with foo (y/n/a/q/l/^E/^Y)? 
    '*'                   -- searches forward for the next occurrence of the word under the cursor ('#' does the same backwards
    n                     -- search again with the last search string
    N                     -- search backwards with the last search string

    [I                    -- show lines matching word under cursor <cword> (super)

## Misc

    :Bonly      -- close all buffers but the current one (BufOnly plugin)
    [I          -- show lines matching word under cursor <cword> (super)
    :set list   -- display invisible characters (:set list!  will "unset" the option)
    d/while     -- delete everything from cursor position to the next occurence of "while"
    gf          -- open file name under cursor (SUPER)
    ~           -- changes case of current letter
    :cd %:h     -- change to the dir of the current file

## insert mode commands

    <C-t> and <C-d>   -- change indent level (increment/decrement)
    <C-N><C-P>        -- word completion in insert mode
    <C-R>q            -- display contents of register q (insert mode)

## works only on command line:

    <C-R><C-W>      -- pull word under the cursor into a command line or search
    <C-R><C-A>      -- pull WORD under the cursor into a command line or search
    <C-R> -         -- pull small register
    <C-R> [0-9a-z]  -- pull named registers
    <C-R> %         -- pull file name (also #)

## ex commands:

    delete  d   -- Delete lines
    move    m   -- Move lines
    copy    co  -- Copy lines
    :3,18d                    -- Delete lines 3 through 18.
    :160,224m23               -- Move lines 160 through 244 to follow line 23. (Like delete and put in vi.)
    :23,29co100               -- Copy lines 23 through 29 and put after line 100. (Like yank and put in vi.)
    :1,100w newfile           -- copy lines 1 through 100 to a new file
    :/pattern/d               -- Delete the next line containing pattern.
    :/pattern1/,/pattern2/d   -- Delete from the first line containing pattern1 through the first line containing pattern2.
    :.,/pattern/m23           -- Take text from current line (.) through the first line containing pattern and put after line 23.

## quickfixes:

    ccl       -- close quickfix window
    cc[nr]    -- jump to error nr
    cn        -- jump to next error
    cp        -- jump to previous error
    cw        -- open quickfix window with current error list

## vimdiff

    vert diffsplit other.txt  -- view diff to other file
    :diffthis                 -- use diff on current buffer
    :diffoff                  -- turn diff off on current buffer
    :diffoff!                 -- turn diff off on all buffers

## Recording macros

    qq      -- record to register 'q' your complex series of commands
    q       -- end recording
    @q      -- execute
    @@      -- Repeat
    5@@     -- Repeat 5 times

## recreate past state

    gv   -- reselect last visual area (ultra)
    gi   -- go to last edited location and enter insert mode
    '.   -- jump to last modification line (SUPER)
    `.   -- jump to exact spot in last modification line
    g;   -- cycle thru recent changes (oldest first)
    g,   -- reverse direction

## numbers

    <C-A>,<C-X>         -- increment,decrement number under cursor
    <C-R>=4*5           -- insert 25 into text (mini-calculator)

## movement

    gg      -- Goto start of file
    G       -- Goto end of file
    :54     -- Goto line 54
    Ctrl-E  -- scroll up, 'e'xtra lines
    Ctrl-Y  -- scroll down
    Ctrl-D  -- scroll window down
    Ctrl-U  -- scroll window up
    Ctrl-B  -- move one screen 'b'ackward
    Ctrl-F  -- move one screen 'f'orward 
    %       -- Goto matching #if #else,{},(),[],/* */
    'f' + any character -- find its next occurrence in the line
    'H', 'M' and 'L'    -- take the cursor directly to the 'H'ighest, 'M'iddle, or 'L'ower line on the screen
    'zt', 'zz' and 'zb' -- keep the cursor at the current position, but scroll the view so that it falls at the 't'op, 'z' center, or 'b'ottom of the screen

## completion

    C-p, C-x C-p        -- Autocompletion
    <C-N><C-P>          -- word completion in insert mode
    <C-X><C-L>          -- Line complete SUPER USEFUL
    <C-X><C-F>          -- insert name of a file in current directory
    'q:' or ':<Ctrl-f>' -- gives the command history window

## file stuff

    :sp or :vsp for vertical split    -- open new view on same file
    vim -p fred.php joe.php           -- open files in tabs

## buffers

    ctrl+w ctrl+w     -- jump to other buffer

## haskell

    execute ghci:
    :set makeprg=ghci\ %
    :make

### haskellmode

    :make                 -- load into GHCi, show errors (|quickfix| |:copen|)
    _ct                   -- create |tags| file 
    CTRL-]                -- jump to definition
    CTRL-W_CTRL_]         -- open definition in split window
    :copen                -- open error browser
    :cclose               -- close error browser
    :GHCi take 5 [1..]    -- evaluates expression in ghci

## using terminal e.g.

    :!term ghci Main.hs   -- prerequisite: provide term script that opens terminal!

## editing

    ZZ          -- save and quit
    yiw         -- copy current word
    viw         -- select current word
    D           -- (Delete up to end of line. )(short for "d$")
    d0          -- delete to beginning of line
    dk          -- delete current line and line above
    dj          -- delete current line and line below
    diw         -- delete word under the cursor (excluding white space)
    daw         -- delete word under the cursor (including white space)
    dG          -- delete u or change command.
    'o'         -- to create a new line below, 'O' to enter one above
    '>>' '<<'   -- shift line right/left
    >           -- indent section  useful with Shift+v%
    <           -- unindent section  remember . to repeat and u to undo 
    di>         -- to extract everything within <hello> or di" for "hello"
                'i'         -- to any of them for the 'inside' contents, or
                'a'         -- to include the delimiting characters too.
    '>aB' or '>iB'  -- ("indent a Block")
    yyp         -- duplicate current line

## Joining Lines

    J     -- Join Lines to One. Ex J,3J
    gJ    -- Join Lines without Spaces

## spellchecking

    :set spell  -- enter spell checker, after :set spelllang=en_GB.UTF-8 (mapped to F4)
    ]s          -- " next spelling error after the cursor
    [s          -- " jump backwards
    z=          -- " over a misspelled word you'll be presented with a list of suggested spellings
    zg          -- " add it to your personal dictionary
    zw          -- " add it to the bad word list with 

## Replacing Charcter

    r<Charcter> (Replace Charater Under Cursour. Ex. ru,5ra,3r<Enter> )
    R<Charcter>

## marks

    ma    -- to set mark 'a' 
    'a    -- to jump to this mark

## folding

    zf#j        -- creates a fold from the cursor down # lines.
    zf/string   -- creates a fold from the cursor to string .
    zj          -- moves the cursor to the next fold.
    zk          -- moves the cursor to the previous fold.
    zo          -- opens a fold at the cursor.
    zO          -- opens all folds at the cursor.
    zm          -- increases the foldlevel by one.
    zM          -- closes all open folds.
    zr          -- decreases the foldlevel by one.
    zR          -- decreases the foldlevel to zero -- all folds will be open.
    zd          -- deletes the fold at the cursor.
    zE          -- deletes all folds.
    [z          -- move to start of open fold.
    ]z          -- move to end of open fold.

## Rectangular selection

When we are editing tabular data, sometimes we would want to copy only a few columns from the text as opposed to a few lines. For this, we can use the rectangular block selection mode in Vim by pressing ctrl-v. 

