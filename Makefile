bindir=/usr/local/bin
etcdir=/etc/raspi-rotate
tmpldir=$(etcdir)/xorg.conf.d

install:
	mkdir -p $(bindir)
	mkdir -p $(etcdir)
	mkdir -p $(tmpldir)
	install -m 0755 bin/raspi-rotate-screen $(bindir)
	install -m 0644 etc/xorg.conf.d/99-raspi-rotate.conf.tmpl $(tmpldir)
