Attempt to do not lose Vim stuff again.

        git clone git://github.com/kusor/dotvim.git ~/.vim/
        ln -s ~/.vim/vimrc ~/.vimrc 
        ln -s ~/.vim/gvimrc ~/.gvimrc
        ln -s ~/.vim/eslintrc ~/.eslintrc


Note this requires eslint-plugin-joyent installed locally to work:

        npm install eslint-plugin-joyent --global

Run :PackUpdate once vimrc has been sourced.
