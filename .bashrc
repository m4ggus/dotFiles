# JAVA
export JAVA_FONTS=/usr/share/fonts/truetype/
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSetting=lcd -Dswing.aatext=true -Dsun.java2d.xrender=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# MAN PAGES
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#PS1='\e[0;37m\t |\e[34;36m \u@\h \e[34;37m| \w \e[0m\n\$ '

#PS1='┌──┤ \t ├──┤ \u@\h │\n└── \w \$'

PS1="\[\e[01;37m\]┌─[\t][\u@\h][$]: \w\[\e[01;37m\]\n\[\e[01;37m\]└──\[\e[01;37m\]──╼\[\e[0m\] "

