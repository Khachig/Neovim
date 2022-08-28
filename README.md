<h1 align="center">
  <a href="https://github.com/neovim/neovim">
    <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" />
  </a>
</h1>

This is my custom Neovim config written in Fennel.  

<h1>
  Fennel?
  <a href=""><img src="https://fennel-lang.org/logo.svg" width="30px" /></a>
</h1>

[Fennel][1] is a dialect of [Lisp][2] that compiles to [Lua][3].  
Lua is the embedded configuration language for Neovim; however, since I really like using Lisp, I decided to go with Fennel instead.  

Since it runs on Lua, it's basically a different notation to write the same thing but it helps you avoid some 
common pitfalls of Lua, such as variable scoping issues, operator precedence ambiguity, lack of builtin nil checks for function arguments, etc..  

With all that said, you don't have to touch Fennel if you don't want to. You can simply edit the Lua files after you compile the first time.

## Installation
First, you have to have Packer installed for managing plugins. You can find installation instructions from [their github page](https://github.com/wbthomason/packer.nvim).  
Then, you have to install Fennel. You can find the instructions for that [here](https://fennel-lang.org/setup).  
Once you have everything, you can clone this repository somewhere into your runtimepath (`~/.nvim` or `~/.config/nvim` etc) and run `make`.  

After that, before launching Neovim, you should run:  
```nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'PackerCompile'```

[1]: https://fennel-lang.org
[2]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[3]: https://www.lua.org
