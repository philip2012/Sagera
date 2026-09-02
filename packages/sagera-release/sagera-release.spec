Name:           sagera-release
Version:        0.1
Release:        1%{?dist}
Summary:        Sagera distribution release information

License:        MIT
BuildArch:      noarch
Source0:        sagera-release

%description
Release information for the Sagera Linux distribution.

%install
mkdir -p %{buildroot}%{_sysconfdir}
install -m 0644 %{SOURCE0} %{buildroot}%{_sysconfdir}/sagera-release

%files
%{_sysconfdir}/sagera-release

%changelog
* Wed Sep 02 2026 Philips <philips@sagera.local> - 0.1-1
- Initial Sagera release package
