mkdir -p $HOME/.fonts
FONTS_DIRECTORY="${HOME}/.fonts"

## Clone fonts
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git $FONTS_DIRECTORY/RictyDiminished

## Find and Move .ttf, .ttc to root directory
if cd "$FONTS_DIRECTORY"; then
  mv `find . -name "*.tt*" -type f` . 2>/dev/null

  ## Remove directories
  rm -rf `find * -type d`

  ## Install fonts
  mv -f ./* /Library/Fonts

  ## Remove fonts directory
  rm -rf $FONTS_DIRECTORY
fi
