# Testing new Neovim configurations

... before replace the one used for daily work

## Installation

This is into my `.bashrc`

```
NEOVIM=~/.config/neovim
export NEOVIM

alias neovim='XDG_DATA_HOME=$NEOVIM/share XDG_CONFIG_HOME=$NEOVIM nvim'
export neovim
```

So I can keep testing new stuff using `neovim <FileName>` while working using
`nvim <FileName>`.

## Plugins config

The code running automated plugin setup on init comes from [alpha2phi](https://alpha2phi.medium.com/)
intro to Neovim configuration, concretely:

https://github.com/alpha2phi/neovim-for-beginner/blob/01-init.lua/lua/plugins.lua
