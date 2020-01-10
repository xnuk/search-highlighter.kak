# search-highlighter

[![IRC][IRC Badge]][IRC]

###### [Usage](#usage) | [Documentation](#commands) | [Contributing](CONTRIBUTING)

> A smart search highlighter for [Kakoune], enabled in context of search.

## Installation

### [Pathogen]

``` kak
pathogen-infect /home/user/repositories/github.com/alexherbo2/search-highlighter.kak
```

## Usage

``` kak
hook global WinCreate .* %{
  search-highlighter-enable
}
```

- Search for a word to see the highlighter.
- Press <kbd>Escape</kbd> to disable highlighting.
- Press <kbd>n</kbd> or a search command to re-enable highlighting.
- You can see the primary selection face is highlighted differently when overlapping a search occurence.

## Commands

- `search-highlighter-enable`: Enable search highlighter
- `search-highlighter-disable`: Disable search highlighter
- `search-highlighter-selection-enable`: Enable main selection highlighting on search overlapping
- `search-highlighter-selection-disable`: Disable main selection highlighting on search overlapping

## Faces

- `Search` `white,yellow`: Search face
- `PrimarySelectionSearch` `white,red`: Main selection face when overlapping search
- `PrimarySelectionDefault` `white,blue`: Main selection face – Work-around missing `%face{<name>}`

[Kakoune]: https://kakoune.org
[IRC]: https://webchat.freenode.net/#kakoune
[IRC Badge]: https://img.shields.io/badge/IRC-%23kakoune-blue.svg
[Pathogen]: https://github.com/alexherbo2/pathogen.kak
