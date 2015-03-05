## Nginx, custom debian packages

Prerequisites (alternatively do `vagrant up`, it will do this for you):

    sudo add-apt-repository ppa:nginx/stable
    sudo apt-get update
    sudo apt-get build-dep nginx
    sudo apt-get install libgd2-noxpm-dev

Building packages:

    git clone git@github.com:shamrin/nginx.git
    cd nginx/nginx-1.6.2/
    dpkg-buildpackage -b
    cd ..

Testing packages:

    sudo dpkg -i nginx-common_1.6.2-5+precise0shamrin1_all.deb nginx-full_1.6.2-5+precise0shamrin1_amd64.deb  nginx_1.6.2-5+precise0shamrin1_all.deb

Uploading as GitHub release:

    git tag v1.6.2-5+precise0shamrin1

Then create [GitHub release][1] and upload packages there.

[1]: https://github.com/shamrin/nginx/releases

## Rough description of how this repo was created

**Don't read if you don't want to re-create this repo from scratch**

Local Ansible:

    make
    . venv/bin/activate

Vagrant:

    vagrant up
    vagrant ssh
    cd /vagrant

Get nginx:

    sudo apt-get build-dep nginx
    apt-get source nginx
    rm nginx_1.6.2*
    git add nginx-1.6.2
    git commit

Get nginx-push-stream-module:

    cd nginx-1.6.2/debian/modules
    git clone https://github.com/wandenberg/nginx-push-stream-module.git
    cd nginx-push-stream-module/
    git log -1
    rm -rf .git
    git add .
    git commit
    cd ../../../..

Add nginx-push-stream-module to debian/rules:

    cd nginx-1.6.2/
    vi debian/rules

And add `--add-module=$(MODULESDIR)/nginx-push-stream-module` to `full_configure_flags` list.

Links:

* http://serverfault.com/questions/227480/installing-optional-nginx-modules-with-apt-get
* http://lookonmyworks.co.uk/2014/05/13/building-nginx-with-the-push-stream-module-on-debian/
