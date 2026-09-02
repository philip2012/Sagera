Name:           sagera-release
Version:        0.2
Release:        1%{?dist}
Summary:        Sagera distribution release information

License:        MIT
BuildArch:      noarch
Source0:        sagera-release
Source1:        sagera-release.conf

%description
Release and compatibility information for the Sagera Linux distribution.

%install
mkdir -p %{buildroot}%{_sysconfdir}
mkdir -p %{buildroot}%{_prefix}/lib

install -m 0644 %{SOURCE0} \
    %{buildroot}%{_sysconfdir}/sagera-release

install -m 0644 %{SOURCE1} \
    %{buildroot}%{_prefix}/lib/sagera-release

%files
%{_sysconfdir}/sagera-release
%{_prefix}/lib/sagera-release

%changelog
* Wed Sep 02 2026 Philips <99601790+philip2012@users.noreply.github.com> - 0.2-1
- Add machine-readable Sagera release metadata

* Wed Sep 02 2026 Philips <99601790+philip2012@users.noreply.github.com> - 0.1-1
- Initial Sagera release package