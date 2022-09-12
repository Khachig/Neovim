local cmd = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath("data") .. "/site/pack"
local fmt = string.format

function ensure(user, repo)
    local install_path = fmt("%s/packer/start/%s", pack_path, repo)
    if fn.empty(fn.glob(install_path)) > 0 then
        cmd(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
	cmd(fmt("packadd %s", repo))
    end
end

-- Bootstrap essential plugins necessary to load everything else
ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")
ensure("lewis6991", "impatient.nvim")

-- Impatient pre-compiles and caches Lua modules
require("impatient")

-- Enable Aniseed's automatic compilation and loading of Fennel code
vim.g["aniseed#env"] = {
    module = "config.init",
    compile = true
}
