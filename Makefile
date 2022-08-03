.PHONY: all init configs core confdir coredir cleanlua

CONFDIR := lua/configs/
COREDIR := lua/core/

FNLCONFIGS := $(wildcard fnl/configs/*.fnl)
FNLCONFFILES := $(notdir ${FNLCONFIGS})
LUACONFIGS := $(FNLCONFFILES:.fnl=.lua)
FNLCORE := $(wildcard fnl/core/*.fnl)
FNLCOREFILES := $(notdir ${FNLCORE})
LUACORE := $(FNLCOREFILES:.fnl=.lua)

CONFIGS = $(addprefix $(CONFDIR), $(LUACONFIGS))
CORE = $(addprefix $(COREDIR), $(LUACORE))

all: init.lua utils.lua $(CONFIGS) $(CORE)

utils.lua: fnl/utils.fnl
	fennel --compile $< > lua/$@

init.lua: fnl/init.fnl
	fennel --compile $< > $@

$(CONFIGS): lua/configs/%.lua: fnl/configs/%.fnl | confdir
	fennel --compile $< > $@

$(CORE): lua/core/%.lua: fnl/core/%.fnl | coredir
	fennel --compile $< > $@

confdir:
	@mkdir -p $(CONFDIR)

coredir:
	@mkdir -p $(COREDIR)

cleanlua:
	@echo "Deleting all Lua files. Fennel files won't be affected."
	@echo "You have to run 'make' before using Nvim to load your configurations."
	@echo
	rm *.lua lua/*.lua $(CONFDIR)*.lua $(COREDIR)*.lua 2> /dev/null
