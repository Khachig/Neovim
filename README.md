# Neovim Config 
This is my custom Neovim config written in Fennel.  

## What the heck is Fennel?
[Fennel](https://fennel-lang.org) is a dialect of [Lisp][1] that compiles to Lua.  
Lua is the embedded configuration language for Neovim; however, since I really like using Lisp, I decided to go with Fennel instead.  

Since it runs on Lua, it's basically a different notation to write the same thing but it helps you avoid some 
common pitfalls of Lua, such as variable scoping issues, operator precedence ambiguity, lack of arity checks for function arguments, etc..  

With all that said, you don't have to touch Fennel if you don't want to. You can simply edit the Lua files after you compile the first time.

## Installation
First, you have to have Packer installed for managing plugins. You can find installation instructions from [the github page](https://github.com/wbthomason/packer.nvim).  
Once you have that, you can clone this repository somewhere into your runtimepath (`~/.nvim` or `~/.config/nvim` etc) and run `make`.  

After that, before launching Neovim, you should run:  
```nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'PackerCompile'```

[1]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
