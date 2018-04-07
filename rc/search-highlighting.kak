set-face global Search white,yellow
set-face global PrimarySelectionSearch white,red
set-face global PrimarySelectionDefault white,blue

define-command search-highlighting-enable -docstring 'Enable search highlighting' %{
  hook window -group search-highlighting NormalKey [/?*nN]|<a-[/?*nN]> %{ try %{
    add-highlighter window dynregex '%reg{/}' 0:Search
    search-highlighting-selection-enable
  }}
  hook window -group search-highlighting NormalKey <esc> %{ try %{
    remove-highlighter window/dynregex_%reg{<slash>}
    search-highlighting-selection-disable
  }}
}

define-command search-highlighting-disable -docstring 'Disable search highlighting' %{
  remove-highlighter window/dynregex_%reg{<slash>}
  remove-hooks window search-highlighting
  search-highlighting-selection-disable
}

define-command search-highlighting-selection-enable -docstring 'Enable main selection highlighting on search overlapping' %{
  hook window -group search-highlighting-selection NormalIdle .* %{ %sh{
    if test -n "$kak_reg_slash"; then
      echo '
        try %{
          set-register X %reg{/}
          execute-keys -draft -no-hooks <a-k>\A<c-r>X\z<ret>
          set-face global PrimarySelection PrimarySelectionSearch
        } catch %{
          set-face global PrimarySelection PrimarySelectionDefault
        }
      '
    else
      echo set-face global PrimarySelection PrimarySelectionDefault
    fi
  }}
}

define-command search-highlighting-selection-disable -docstring 'Disable main selection highlighting on search overlapping' %{
  remove-hooks window search-highlighting-selection
  set-face global PrimarySelection PrimarySelectionDefault
}
