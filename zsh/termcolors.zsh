# terminal colors

# ATTENTION: from https://github.com/ninrod/dotfiles/issues/134 we know that
# this could be replace by:
# autload -U colors
# colors
# then we could use colors like this:
# echo "${fg[yellow]}  Example text.  ${reset_color}"
# echo "${fg_bold[yellow]}  Example text.  ${reset_color}"
# echo "${bg_bold[yellow]}  Example text.  ${reset_color} ${bg[yellow]}${bg_bold[black]} Another text. ${reset_color}"

TC='\e['
Rst="${TC}0m"     # Reset all coloring and style
Black="${TC}30m";
Red="${TC}31m";
Green="${TC}32m";
Yellow="${TC}33m";
Blue="${TC}34m";
Purple="${TC}35m";
Cyan="${TC}36m";
White="${TC}37m";
