provide-module search-highlighter %{
  set-face global Search +u
  add-highlighter shared/search dynregex '%reg{/}' 0:Search
  define-command search-highlighter-enable -docstring 'Enable search-highlighter' %{
    search-highlighter-up
  }
  define-command search-highlighter-disable -docstring 'Disable search-highlighter' %{
    search-highlighter-down
    remove-hooks window search-highlighter
  }
  define-command -hidden search-highlighter-up %{
    add-highlighter window/search ref search
    hook -once -group search-highlighter window NormalKey '<esc>' %{
      search-highlighter-down
    }
  }
  define-command -hidden search-highlighter-down %{
    remove-highlighter window/search
    hook -once -group search-highlighter window NormalKey '[/?*nN]|<a-[/?*nN]>' %{
      search-highlighter-up
    }
  }
}

require-module search-highlighter
