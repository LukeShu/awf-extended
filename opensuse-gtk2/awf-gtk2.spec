Name:          awf-gtk2
Version:       2.7.0
Release:       0
Summary:       Theme preview application for GTK 2
Summary(fr):   Application d'aperçu de thème pour GTK 2
License:       GPL-3.0-or-later
URL:           https://github.com/luigifab/awf-extended
Source0:       %{url}/archive/v%{version}/%{name}-%{version}.tar.gz

BuildRequires: aspell-fr
BuildRequires: autoconf
BuildRequires: automake
BuildRequires: desktop-file-utils
BuildRequires: gcc
BuildRequires: gettext
BuildRequires: gtk2-devel
Requires:      gtk2
Requires:      hicolor-icon-theme

%description %{expand:
A widget factory is a theme preview application for GTK. It displays the
various widget types provided by GTK in a single window allowing to see
the visual effect of the applied theme.

This package provides the GTK 2 version.}

%description -l fr %{expand:
La fabrique à widgets est une application d'aperçu de thème pour GTK. Elle
affiche les différents types de widgets fournis par GTK dans une seule
fenêtre permettant de voir l'effet visuel du thème appliqué.

Ce paquet fournit la version GTK 2.}


%prep
%setup -q -n awf-extended-%{version}
sed -i 's/ -eq 3/ -eq -1/g' configure.ac
sed -i 's/ -eq 4/ -eq -1/g' configure.ac
touch {NEWS,AUTHORS,README,ChangeLog}
mv LICENSE COPYING

%build
autoreconf -fi
%configure
%make_build

%install
%make_install
mkdir -p %{buildroot}%{_datadir}/applications/
mkdir -p %{buildroot}%{_datadir}/icons/hicolor/
mkdir -p %{buildroot}%{_mandir}/man1/ %{buildroot}%{_mandir}/fr/man1/
for file in icons/*/*/*; do mv $file ${file/\/awf./\/%{name}.}; done
cp -a icons/* %{buildroot}%{_datadir}/icons/hicolor/
for file in src/po/*.po; do
  code=$(basename "$file" .po)
  mkdir -p %{buildroot}%{_datadir}/locale/${code}/LC_MESSAGES/
  msgfmt src/po/${code}.po -o %{buildroot}%{_datadir}/locale/${code}/LC_MESSAGES/%{name}.mo
done
install -p -m 644 debian-gtk/%{name}.1 %{buildroot}%{_mandir}/man1/%{name}.1
install -p -m 644 debian-gtk/%{name}.fr.1 %{buildroot}%{_mandir}/fr/man1/%{name}.1
desktop-file-install --dir=%{buildroot}%{_datadir}/applications/ applications/%{name}.desktop
%find_lang %{name} --with-man

%files -f %{name}.lang
%license COPYING
%doc README.md
%{_bindir}/%{name}
%{_mandir}/man1/%{name}.1*
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
%{_datadir}/icons/hicolor/scalable/apps/%{name}.svg


%changelog
* Fri Jun 16 2023 Fabrice Creuzot <code@luigifab.fr> - 2.7.0-2
- Package spec update

* Tue Jun 06 2023 Fabrice Creuzot <code@luigifab.fr> - 2.7.0-1
- New upstream release

* Thu Sep 09 2021 Fabrice Creuzot <code@luigifab.fr> - 2.6.0-1
- New upstream release

* Wed Jul 07 2021 Fabrice Creuzot <code@luigifab.fr> - 2.5.0-1
- New upstream release

* Wed May 05 2021 Fabrice Creuzot <code@luigifab.fr> - 2.4.0-1
- New upstream release

* Sun Apr 04 2021 Fabrice Creuzot <code@luigifab.fr> - 2.3.0-1
- Initial openSUSE package release
