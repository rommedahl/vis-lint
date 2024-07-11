--https://github.com/ninewise/dotfiles/blob/master/config/vis/visrc.lua
--https://git.sr.ht/~gjabell/vis-check
--https://git.sr.ht/~gjabell/vis-fix

local lint = vis:action_register("lint", function()
    local lint_templates = {
        ["bash"] = "!shellcheck %s | less -R",
        ["python"] = "!ruff check --select E --line-length 79 %s | less -R",
    }
    local lint_template = lint_templates[vis.win.syntax]
    if lint_template then
        vis:command(string.format(lint_template, vis.win.file.name))
    else
        vis:info(string.format("No linter configured for %s", vis.win.syntax))
    end
end, "Linter")

vis:map(vis.modes.NORMAL, ";l", lint)
