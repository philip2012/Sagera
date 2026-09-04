Name:           sagera-settings
Version:        0.1
Release:        1%{?dist}
Summary:        Default system settings for Sagera

License:        MIT
BuildArch:      noarch

Source0:        files/90-sagera.conf
Source1:        files/90-sagera-journald.conf

Requires:       systemd
Requires:       sagera-release

%description
Default system-level configuration for the Sagera Linux distribution.

%install
mkdir -p %{buildroot}%{_sysctldir}
mkdir -p %{buildroot}%{_prefix}/lib/systemd/journald.conf.d

install -m 0644 %{SOURCE0} \
    %{buildroot}%{_sysctldir}/90-sagera.conf

install -m 0644 %{SOURCE1} \
    %{buildroot}%{_prefix}/lib/systemd/journald.conf.d/90-sagera.conf

%files
%{_sysctldir}/90-sagera.conf
%{_prefix}/lib/systemd/journald.conf.d/90-sagera.conf

%changelog
* Thu Sep 03 2026 Philips <99601790+philip2012@users.noreply.github.com> - 0.1-1
- Initial Sagera system defaults