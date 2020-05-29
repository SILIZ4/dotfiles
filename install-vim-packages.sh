cd 
mkdir -p .vim/autoload
cd .vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ..
mkdir bundle
cd bundle/
git clone https://github.com/preservim/nerdcommenter.git
git clone https://github.com/lervag/vimtex.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/xuhdev/vim-latex-live-preview.git
git clone https://github.com/iamcco/markdown-preview.nvim.git
git clone https://github.com/ajmwagar/vim-deus.git
git clone https://github.com/preservim/nerdtree.git
cd ..
mkdir -p pack/coc/start
cd pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
