#!/bin/bash

VAGRANT_DIR=/vagrant
HOME_DIR=~/
HOME_SERVERS_DIR=$HOME_DIR/servers
HOME_PUBLIC_HTML_DIR=$HOME_DIR/public_html
HOME_BIN_DIR=$HOME_DIR/bin

installPackage()
{
  local packages=$*
  echo "Installing $packages"
  sudo apt-get install -y $packages
}

indent() 
{
  echo -n '    '
}

download()
{
  local url=$2
  local file=$1
  echo "Downloading $file"
  #wget --progress=dot $3 $url >/dev/null 2>&1
  wget --progress=dot $3 $url
}

downloadSoftwares()
{
    #download nodejs
    nodejs="node-v7.3.0-linux-x64.tar.gz"
    if [ ! -e $nodejs ] 
        then
            indent; echo "There is no $nodejs"
            indent; indent; download "$nodejs" "https://nodejs.org/dist/v7.3.0/$nodejs"
        else
            indent; echo "$nodejs is available"
    fi
    cp -r $VAGRANT_DIR/$nodejs $HOME_BIN_DIR
}

run() {
    cd $VAGRANT_DIR
    downloadSoftwares
    
    cd $HOME_BIN_DIR
    #install nodejs
    indent; echo "Extracting $file"
    tar xvzf $nodejs
    indent; echo 'Cleaning'
    rm $nodejs
  
    #update bashrc
    echo 'Updating .bashrc'
    cat $VAGRANT_DIR/bashrc.template >> $HOME_DIR/.bashrc
    source $HOME_DIR/.bashrc
    
    #install yeoman
    npm install -g yo
}


if [ ! -f "/var/vagrant_provision" ]; then
  sudo touch /var/vagrant_provision
  run
else
  echo "Nothing to do"
fi
