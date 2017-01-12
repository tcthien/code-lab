#!/bin/bash

# Generic methods ----------------------------------------------------------------
installPackage()
{
    local packages=$*
    echo "Installing $packages"
    sudo apt-get install -y $packages >/dev/null 2>&1
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
    wget --progress=dot $url >/dev/null 2>&1
}
appendToBashrc()
{
    echo ${1} >> ~/.bashrc
}
# End Generic methods ----------------------------------------------------------------

installCassandra()
{
    # Update chmod in /bin/
    sudo chmod 777 ~/bin/
    echo "Installing Cassandra"
    cd /vagrant
    local cassandra="apache-cassandra-3.9-bin.tar.gz"
    local cassandraFolder="apache-cassandra-3.9"
    # Check & install cassandra ---------------------------------------------------------
    if [ ! -e $cassandra ] 
    then
        indent; echo "Prepare to download $cassandra"
        download $cassandra http://supergsego.com/apache/cassandra/3.9/$cassandra
        file $cassandra
    else
        indent; echo "Nothing new to download"
    fi
    # Copy cassandra to ~/bin
    cp -v $cassandra ~/bin/
    # Extract & add cassandra to PATH
    cd ~/bin/
    indent; echo "Extracting ~/bin/$cassandra"
    tar xvzf ./$cassandra >/dev/null 2>&1
    rm -rf $cassandra
    sudo chmod 777 ~/bin/$cassandraFolder
        
        # Add Cassandra home to bashrc ------------------------------------------------------
    appendToBashrc ''
    appendToBashrc '#Add Cassandra Home'
    appendToBashrc 'export CASSANDRA_HOME=~/bin/apache-cassandra-3.9/'
    appendToBashrc 'export PATH="${CASSANDRA_HOME}/bin/:$PATH"'
}

run() {
    # Edit 1: Write method here
    installCassandra
}


# Edit 2: Consider to change vagrant_codelab_provision for your case
if [ ! -f "/var/vagrant_codelab_provision" ]; then
    sudo touch /var/vagrant_codelab_provision
    run
else
    echo "Nothing to do"
fi
