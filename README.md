
## Install git-subtree

    git clone https://github.com/git/git.git --depth=1
    cd git/contrib/subtree
    make
    sudo cp git-subtree /usr/lib/git-core/

via http://stackoverflow.com/a/13581113/17708

## Vagrant

    vagrant up
    vagrant ssh
    cd /vagrant

## Get nginx

    sudo apt-get build-dep nginx
    apt-get source nginx
    rm nginx_1.6.2*
    git add nginx-1.6.2
    git commit

## Get nginx-push-stream-module

    git clone https://github.com/wandenberg/nginx-push-stream-module.git
    rm -rf nginx-push-stream-module/.git
    git add nginx-push-stream-module/
    git commit
    cd nginx-1.6.2/
    vi debian/rules

add to `full_configure_flags` list:

```
\
--add-module=../../nginx-push-stream-module
```

* dpkg-buildpackage -b

* dpkg --install nginx-common_*.deb nginx-full_*.deb

http://serverfault.com/questions/227480/installing-optional-nginx-modules-with-apt-get
