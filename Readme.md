Attempt to do not lose Vim stuff again.

        git clone git://github.com/kusor/dotvim.git ~/.vim/
        ln -s ~/.vim/vimrc ~/.vimrc 
        ln -s ~/.vim/gvimrc ~/.gvimrc
        ln -s ~/.vim/eslintrc ~/.eslintrc


Note this requires eslint-plugin-joyent installed locally to work:

        npm install eslint-plugin-joyent --global

And `syntastic` vim plugin:

        https://github.com/vim-syntastic/syntastic.git

Other plugins installed with pathogen:

        https://github.com/fatih/vim-go.git
        
