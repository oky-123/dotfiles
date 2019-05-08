mkdir -p $HOME/.fonts

git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git $HOME/.fonts/RictyDiminished

fc-cache -vf $HOME/.fonts/
