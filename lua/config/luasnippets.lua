local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

ls.filetype_extend("all", { "_" })

require("luasnip.loaders.from_snipmate").lazy_load()

ls.snippets = {
  all = {
    s("jira", {
      t("["),
      f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t("]"),
      i(1),
      t("(https://jira-joyent.atlassian.net/browse/"),
      i(1),
      t(")"),
      i(0),
    }),
  },
}

ls.autosnippets = {
  all = {
    s("autotrigger", {
      t("autosnippet"),
    }),
  },
}
