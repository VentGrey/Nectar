# Install Nectar

install-core:
	install -dm755 $(DESTDIR)/usr/bin/
	install -dm755 $(DESTDIR)/usr/share/nectar/

	for f in *; do [[ $$f != "plugins" ]] && cp -pr $$f $(DESTDIR)/usr/share/nectar/; done

	install -Dpm 0755 nectar.exec $(DESTDIR)/usr/bin/fedy

	install -Dpm 0644 nectar.desktop $(DESTDIR)/usr/share/applications/org.folkswithhats.fedy.desktop
	install -Dpm 0644 nectar.appdata.xml $(DESTDIR)/usr/share/metainfo/fedy.appdata.xml

	install -Dpm 0644 nectar.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/fedy.svg
	install -Dpm 0644 nectar-symbolic.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/fedy-symbolic.svg

	install -Dpm 0644 run-as-root.policy $(DESTDIR)/usr/share/polkit-1/actions/org.folkswithhats.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi


install-plugins:
	install -dm755 $(DESTDIR)/usr/share/nectar/plugins

	cp -pr plugins/* $(DESTDIR)/usr/share/nectar/plugins/


install: install-core install-plugins


uninstall:
	rm -rf $(DESTDIR)/usr/share/nectar/

	rm -f $(DESTDIR)/usr/bin/nectar

	rm -f $(DESTDIR)/usr/share/applications/org.folkswithhats.nectar.desktop
	rm -f $(DESTDIR)/usr/share/metainfo/nectar.appdata.xml

	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/nectar.svg
	rm -f $(DESTDIR)/usr/share/icons/hicolor/scalable/apps/nectar-symbolic.svg

	rm -f $(DESTDIR)/usr/share/polkit-1/actions/org.folkswithhats.pkexec.run-as-root.policy

	@-if test -z $(DESTDIR); then gtk-update-icon-cache -f -t $(DESTDIR)/usr/share/icons/hicolor; fi
