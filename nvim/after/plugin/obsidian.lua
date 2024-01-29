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
    -- note_id_func = function(title)
    --     -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    --     -- In this case a note with the title 'My new note' will be given an ID that looks
    --     -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    --     local suffix = ""
    --     if title ~= nil then
    --       -- If title is given, transform it into valid file name.
    --       suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    --     else
    --       -- If title is nil, just add 4 random uppercase letters to the suffix.
    --       for _ = 1, 4 do
    --         suffix = suffix .. string.char(math.random(65, 90))
    --       end
    --     end
    --     return tostring(os.time()) .. "-" .. suffix
    -- end,
    note_id_func = function(title) 
        return title
    end,

})
