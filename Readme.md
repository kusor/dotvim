Attempt to do not lose Vim stuff again.

        git clone git://github.com/kusor/dotvim.git ~/.vim/
        ln -s ~/.vim/vimrc ~/.vimrc 
        ln -s ~/.vim/gvimrc ~/.gvimrc

        export VIMCONFIG=~/.vim
        export VIMDATA=~/.vim
        mkdir -p $VIMCONFIG/pack/bundle/start
        mkdir -p $VIMDATA/undo
        mkdir -p $VIMCONFIG/pack/minpac/opt
        cd $VIMCONFIG/pack/minpac/opt
        git clone https://github.com/k-takata/minpac.git

Then open .vimrc and run `:PackUpdate` to install the plugins.

Configure neovim:

        mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
        ln -s ~/.vim $XDG_CONFIG_HOME/nvim
        ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

Eslint:

        ln -s ~/.vim/eslintrc ~/.eslintrc

Note this requires eslint-plugin-joyent installed locally to work:

        npm install eslint-plugin-joyent --global


