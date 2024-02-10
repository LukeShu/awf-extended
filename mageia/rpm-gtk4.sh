#!/bin/bash
# Mageia: sudo urpmi --no-recommends rpmdevtools rpmlint rpm-sign autoconf automake gtk4-devel desktop-file-utils aspell-fr enchant2-aspell


cd "$(dirname "$0")"
version="2.8.0"
gtk="gtk4"

mkdir -p builder ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
find builder/* ! -name "*$version*.rpm" ! -name "*$version*.gz" -exec rm -rf {} + 2>/dev/null

# copy to a tmp directory
if [ true ]; then
	chmod 644 awf-$gtk.spec
	spectool -g -R awf-$gtk.spec
else
	temp=awf-extended-$version
	mkdir /tmp/$temp
	cp -r ../* /tmp/$temp/
	rm -rf /tmp/$temp/*/builder/

	mv /tmp/$temp builder/
	cp /usr/share/common-licenses/GPLv3 builder/$temp/LICENSE

	cd builder/
	tar czf $temp.tar.gz $temp
	cd ..

	cp builder/$temp.tar.gz ~/rpmbuild/SOURCES/awf-$gtk-$version.tar.gz
	chmod 644 awf-$gtk.spec
fi

# create package (rpm sign https://access.redhat.com/articles/3359321)
rpmbuild -ba awf-$gtk.spec
rpm --addsign ~/rpmbuild/RPMS/*/awf-$gtk*.rpm
rpm --addsign ~/rpmbuild/SRPMS/awf-$gtk*.rpm
mv ~/rpmbuild/RPMS/*/awf-$gtk*.rpm builder/
mv ~/rpmbuild/SRPMS/awf-$gtk*.rpm builder/
echo "==========================="
rpm --checksig builder/*.rpm
echo "==========================="
rpmlint awf-$gtk.spec builder/*.rpm
echo "==========================="
ls -dlth "$PWD/"builder/*.rpm
echo "==========================="

# cleanup
rm -rf builder/*/