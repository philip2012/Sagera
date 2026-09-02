# Sagera Product Specification

## Purpose

Sagera is a Fedora-based general-purpose Linux desktop designed to be
polished, convenient, and opinionated without restricting user choice.

It targets everyday users while providing strong paths for gaming and
software development without turning the default installation into a
specialized gaming or developer workstation.

## Platform

- Fedora base
- KDE Plasma
- Wayland
- Btrfs
- SELinux enforcing
- firewalld enabled
- Fedora kernel

Sagera uses the Fedora kernel unchanged and applies Sagera-specific
runtime tuning and kernel command-line defaults where appropriate.

## Desktop Experience

The default Sagera desktop uses:

- a macOS-inspired top bar
- a floating auto-hiding bottom dock
- an adaptive light/dark appearance
- a sage-green primary accent
- Sagera wallpapers

A Windows-style desktop layout will also be available as an alternative.

## Boot Experience

Sagera uses a quiet graphical boot by default.

The normal boot experience should show Sagera branding and a graphical
spinner rather than raw kernel or systemd output.

Verbose boot remains available for troubleshooting.

## Default Applications

- Browser: Brave Origin via Flatpak/Flathub
- Terminal: Konsole
- Shell: Bash
- File manager: Dolphin
- Text editor: Kate
- Video player: MPV
- Image viewer: Gwenview

No office suite or dedicated music player is installed by default.

OnlyOffice is recommended for users who need an office suite.

Visual Studio Code is recommended through Sagera Welcome for software
development.

## Software Distribution

Sagera supports:

- RPM/DNF
- Flatpak
- Flathub
- Sagera repositories
- RPM Fusion

## Gaming

Sagera should make gaming easy without becoming a gaming-focused
distribution.

Steam and gaming utilities are not installed by default.

Gaming software and configuration may be offered through Sagera Welcome.

## Development

Large development toolchains are not installed by default.

Sagera Welcome may offer development tooling including:

- GCC
- Clang
- CMake
- Ninja
- Python
- Rust
- Node.js
- GDB
- LLDB
- Visual Studio Code
- container tooling

## Hardware

Sagera should detect relevant hardware and offer appropriate additional
drivers where necessary.

NVIDIA driver setup should be handled through Sagera Welcome rather than
silently modifying the system.

## Updates

Sagera follows a stable release model.

New releases should ship only after Sagera-specific testing against the
underlying Fedora release.

Updates should notify the user rather than automatically installing by
default.

## Multimedia

Sagera should provide or enable as much multimedia functionality as can
legally and responsibly be distributed.

## Security

Sagera should preserve strong Fedora security defaults, including:

- SELinux enforcing
- firewall enabled
- Secure Boot support as a target
- disk encryption offered to users
- sensible secure system defaults

## Privacy

Sagera should preserve reasonable Fedora privacy defaults.

Any Sagera telemetry or diagnostics should require an explicit user
choice rather than being silently enabled.

## Upstream Identity

Sagera is its own distribution and should present Sagera as the primary
user-facing identity.

The system should transparently acknowledge that it is based on Fedora
Linux in system information and documentation.
