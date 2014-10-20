
" Xterm & Tmux
"------------------------------------------------------------------------------

" Re-map Ctrl combinations "{{{
" Make Ctrl+Tab work in console, see also .config/xorg/Xresources
map <Esc>[27;5;9~ <C-Tab>
map <Esc>[27;6;9~ <C-S-Tab>

" Assigns some xterm(1)-style keys to escape sequences passed by tmux
" when "xterm-keys" is set to "on".  Inspired by an example given by
" Chris Johnsen at https://stackoverflow.com/a/15471820
" Credits: Mark Oteiza
" Documentation: help:xterm-modifier-keys man:tmux(1)
if exists('$TMUX')
  set ttymouse=sgr

  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"

  execute "set <xHome>=\e[1;*H"
  execute "set <xEnd>=\e[1;*F"

  execute "set <Insert>=\e[2;*~"
  execute "set <Delete>=\e[3;*~"
  execute "set <PageUp>=\e[5;*~"
  execute "set <PageDown>=\e[6;*~"

  execute "set <xF1>=\e[1;*P"
  execute "set <xF2>=\e[1;*Q"
  execute "set <xF3>=\e[1;*R"
  execute "set <xF4>=\e[1;*S"

  execute "set <F5>=\e[15;*~"
  execute "set <F6>=\e[17;*~"
  execute "set <F7>=\e[18;*~"
  execute "set <F8>=\e[19;*~"
  execute "set <F9>=\e[20;*~"
  execute "set <F10>=\e[21;*~"
  execute "set <F11>=\e[23;*~"
  execute "set <F12>=\e[24;*~"

  execute "set t_kP=^[[5;*~"
  execute "set t_kN=^[[6;*~"

" }}}
" Cursor Shape {{{
" ------------
" For rxvt-unicode:
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[3 q\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[0 q\<Esc>\\"
	execute 'silent !echo -e "\033kvim\033\\"'

else

	let &t_SI = "\<Esc>[3 q"
	let &t_EI = "\<Esc>[0 q"
endif
" }}}

" vim: set ts=2 sw=2 tw=80 noet :
