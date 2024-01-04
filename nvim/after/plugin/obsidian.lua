require("obsidian").setup({
    workspaces = {
        {
            name = "pp492",
            path = "~/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/pp492"
        },
    },
    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "daily",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil
    },
    follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({"open", url})  -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
    open_notes_in = "vsplit",
})
