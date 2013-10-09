#!/usr/bin/env zsh

if ! [ -e "$HOME/.ssh/id_rsa.pub" ]
then
  echo "Generating ssh key..."
  echo "Please enter the email you want to associate with your ssh key: \c"
  read email
  ssh-keygen -t rsa -C "$email"
fi

if [[ ! -x $(/usr/bin/which -s brew) ]]; then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

echo "Put Homebrew location earlier in PATH ..."
echo "\n# recommended by brew doctor" >> ~/.zshrc
echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.zshrc
source ~/.zshrc

echo "Installing Git..."
brew install git

brew update

echo "Installing Build Essentials..."
brew install readline openssl coreutils
brew link openssl
brew link readline

echo "Installing Handy Tools..."
brew install wget curl tree ctags hub ssh-copy-id keychain zsh vim tmux

echo "Installing Databases..."
brew install mysql redis

echo "Installing Web Servers..."
brew install nginx jetty8

echo "Installing Programming Environments..."
brew install sbt scala node

echo "Installing RVM and Ruby..."
\curl -L https://get.rvm.io | bash -s stable --ruby
gem update --system
gem install bundler

echo "Embracing Cask..."
brew tap phinze/homebrew-cask
brew install brew-cask

echo "Installing Essential Applications with Cask..."
brew cask install alfred google-chrome virtualbox vagrant macvim textmate iterm2 dropbox droplr intellij-community
