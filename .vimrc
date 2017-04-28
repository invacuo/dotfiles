syntax on
colorscheme monokai

set number
set incsearch
set hlsearch

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
