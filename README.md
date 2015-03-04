## Bulding nginx with push-stream-module

* vagrant up
* vagrant ssh
* git clone https://github.com/wandenberg/nginx-push-stream-module.git
* sudo apt-get build-dep nginx
* apt-get source nginx
* cd nginx-1.6.2/
* vi debian/rules
* add to `full_configure_flags` list:

```
\
--add-module=../../nginx-push-stream-module
```

* dpkg-buildpackage -b

* dpkg --install nginx-common_*.deb nginx-full_*.deb

http://serverfault.com/questions/227480/installing-optional-nginx-modules-with-apt-get
