#!/bin/bash
# opensuse: sudo zypper install rpmdevtools rpmlint rpm-build autoconf automake gtk2-devel desktop-file-utils aspell-fr


cd "$(dirname "$0")"
version="2.4.0"
gtk="gtk2"

rm -rf builder/ ~/rpmbuild/
mkdir -p builder ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

# copy to a tmp directory
if [ true ]; then
	chmod 644 awf-${gtk}.spec
	spectool -g -R awf-${gtk}.spec
else
	temp=awf-extended-${version}
	mkdir /tmp/${temp}
	cp -r ../* /tmp/${temp}/
	rm -rf /tmp/${temp}/*/builder/

	mv /tmp/${temp} builder/
	cp /usr/share/licenses/kernel-firmware/GPL-3 builder/${temp}/LICENSE

	cd builder/
	tar czf ${temp}.tar.gz ${temp}
	cd ..

	cp builder/${temp}.tar.gz ~/rpmbuild/SOURCES/awf-${gtk}-${version}.tar.gz
	chmod 644 awf-${gtk}.spec
fi

# create package (rpm sign https://access.redhat.com/articles/3359321)
rpmbuild -ba awf-${gtk}.spec
rpm --addsign ~/rpmbuild/RPMS/*/*.rpm
rpm --addsign ~/rpmbuild/SRPMS/*.rpm
mv ~/rpmbuild/RPMS/*/*.rpm builder/
mv ~/rpmbuild/SRPMS/*.rpm builder/
echo "==========================="
rpm --checksig builder/*.rpm
echo "==========================="
rpmlint awf-${gtk}.spec builder/*.rpm
echo "==========================="
ls -dltrh builder/*.rpm
echo "==========================="

# cleanup
rm -rf builder/*/ ~/rpmbuild/