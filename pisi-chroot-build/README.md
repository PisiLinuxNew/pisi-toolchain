# pisi-chroot-build

It is a short term application to create a chroot environment for building pisi packages. There are different work to add this functionality directly into the pisi application. 

## Usage

It will read the /etc/pisi/pisi.conf for cache of archives and packages.
Both directories will be mounted in the chrooted environment.

The repositories are read from the pisichroot.conf file. 

If you want to use other directories, you can pass it as parameters.

To see the Turkish help  python pisichroot.py -y

To see the English help  python pisichroot.py -h


sudo python pisichroot.py -A source_archive_dir   -P package_archive_dir  -d /home/test/Pisi/wget/pspec.xml -D off

sudo python pisichroot.py -p wget

sudo python pisichroot.py  -u https://github.com/developer/paket/pspec.xml

