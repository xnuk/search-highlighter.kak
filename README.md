[![IRC][shields/kakoune/badge]][freenode/kakoune]

[Kakoune][] extension for search highlighting.

Enable search highlighting in context of search.

Press <kbd>Escape</kbd> to disable search highlighting.

Search highlighting is re-enabled when you are searching.

Installation
------------

``` sh
ln --symbolic $PWD/rc $XDG_CONFIG_HOME/kak/autoload/search-highlighting
```

Usage
-----

``` kak
hook global WinCreate .* %{
  search-highlighting-enable
}
```

Commands
--------

- `search-highlighting-enable`: Enable search highlighting
- `search-highlighting-disable`: Disable search highlighting
- `search-highlighting-selection-enable`: Enable main selection highlighting on search overlapping
- `search-highlighting-selection-disable`: Disable main selection highlighting on search overlapping

Faces
-----

- `Search` `white,yellow`: Search face
- `PrimarySelectionSearch` `white,red`: Main selection face when overlapping search
- `PrimarySelectionDefault` `white,blue`: Main selection face – Work-around missing `%face{<name>}`

[Kakoune]: http://kakoune.org
[freenode/kakoune]: https://webchat.freenode.net?channels=kakoune
[shields/kakoune/badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
