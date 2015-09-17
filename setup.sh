# brew formulas
formulas=(
  brew-cask
  git
  nvm
  findutils
  make
  unzip
  zsh-completions
  coreutils
  imagemagick 
  zsh
  z
)

echo "installing formulas.."
brew install ${apps[@]}

# Apps
apps=(
  dropbox
  qlcolorcode
  appcleaner
  firefox
  qlmarkdown
  iterm2
  qlprettypatch
  shiori
  flux
  mailbox
  qlstephen
  atom
  google-chrome
  transmission
  bettertouchtool
  spectacle
  vlc
  quicklook-json
  skype
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

fonts=(
  font-roboto
  font-inconsolata
  font-raleway
  font-lato
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}