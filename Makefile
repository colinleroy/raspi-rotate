bindir=/usr/local/bin
etcdir=/etc/raspi-rotate
tmpldir=$(etcdir)/xorg.conf.d
hooksdir=$(etcdir)/hooks.d

install:
	mkdir -p $(bindir)
	mkdir -p $(etcdir)
	mkdir -p $(tmpldir)
	mkdir -p $(hooksdir)
	install -m 0755 bin/raspi-rotate-screen $(bindir)
	install -m 0644 etc/xorg.conf.d/99-raspi-rotate.conf.tmpl $(tmpldir)
	install -m 0755 etc/hooks.d/*.sh $(hooksdir)

dist:
	tar -zcf raspi-rotate.tar.gz \
		../raspi-rotate/bin \
		../raspi-rotate/etc \
		../raspi-rotate/COPYING \
		../raspi-rotate/AUTHORS \
		../raspi-rotate/Makefile \
		../raspi-rotate/README.md
