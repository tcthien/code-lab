#!/bin/bash

VAGRANT_DIR=/vagrant
HOME_DIR=~/
HOME_SERVERS_DIR=$HOME_DIR/servers
HOME_PUBLIC_HTML_DIR=$HOME_DIR/public_html
HOME_BIN_DIR=$HOME_DIR/bin

nodejs="node-v7.3.0-linux-x64.tar.gz"
nodejsdir="node-v7.3.0-linux-x64"

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


createDirs()
{
  echo 'Creating directories'
  indent; echo 'Creating bin directory'
  mkdir $HOME_BIN_DIR
  indent; echo 'Creating public_html directory'
  mkdir $HOME_PUBLIC_HTML_DIR
  chmod o+xr $HOME_PUBLIC_HTML_DIR
  mkdir $HOME_SERVERS_DIR
  indent; echo 'Creating servers directory'
}

downloadSoftwares()
{
    #download nodejs
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
    createDirs
    cd $VAGRANT_DIR
    downloadSoftwares
    
    cd $HOME_BIN_DIR
    #install nodejs
    indent; echo "Extracting $file"
    tar xvzf $nodejs >/dev/null 2>&1
    indent; echo 'Cleaning'
    rm $nodejs
  
    #update bashrc
    indent; echo 'Updating .bashrc'
    cat $VAGRANT_DIR/bashrc.template >> $HOME_DIR/.bashrc
    source $HOME_DIR/.bashrc
    
    #install yeoman
    indent; echo 'Installing yeoman'
    cd $HOME_BIN_DIR/$nodejsdir/bin/
    npm install -g yo
}


if [ ! -f "/var/vagrant_provision" ]; then
  sudo touch /var/vagrant_provision
  run
else
  echo "Nothing to do"
fi
