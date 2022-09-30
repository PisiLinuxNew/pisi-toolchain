FROM pisilinux/chroot:base

RUN service dbus start && \
        mkdir /dev/lock && \
	pisi cp && \
	update-ca-certificates -f && \
	pisi dc && \
	pisi ar beta https://ciftlik.pisilinux.org/2.0-Beta.1/pisi-index.xml.xz && \
	pisi ar core https://github.com/pisilinux/core/raw/master/pisi-index.xml.xz && \
	pisi ar main https://github.com/pisilinux/main/raw/master/pisi-index.xml.xz --ignore-check --at 2 && \
    pisi up -dvsy --ignore-safety --ignore-dependency && \
	pisi it --ignore-safety --ignore-dependency autoconf autogen automake binutils bison flex gawk gc gcc gnuconfig guile libmpc libtool-ltdl libsigsegv libtool m4 make nasm mpfr pkgconfig chrpath glibc-devel yacc pisilinux-dev-tools libutil-linux glibc-locales-en expat-devel zlib-devel && \
	service dbus stop

# remove unnecessary files and update pisi.conf to change build_host value.
RUN rm -rf /usr/share/man /usr/share/doc /usr/share/gtk-doc && \
	sed -i 's/build_host = localhost/build_host=farm_yerel/g' /etc/pisi/pisi.conf && \
	localedef -i en_US -c -f UTF-8 en_US.UTF-8

# Set the env variables.
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

WORKDIR /root

