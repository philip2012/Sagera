#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
PKG="$ROOT/packages/sagera-release"
TOPDIR="$ROOT/build/rpmbuild"

SPEC="$PKG/sagera-release.spec"
HUMAN="$PKG/sagera-release"
CONF="$PKG/sagera-release.conf"

spec_version="$(
    awk '$1 == "Version:" { print $2; exit }' "$SPEC"
)"

human_version="$(
    awk 'NR == 1 && $1 == "Sagera" { print $2 }' "$HUMAN"
)"

conf_version="$(
    sed -n 's/^VERSION_ID="\([^"]*\)"$/\1/p' "$CONF"
)"

human_fedora="$(
    awk -F': ' '$1 == "Fedora base" { print $2 }' "$HUMAN"
)"

conf_fedora="$(
    sed -n 's/^FEDORA_BASE="\([^"]*\)"$/\1/p' "$CONF"
)"

if [[ -z "$spec_version" || -z "$human_version" || -z "$conf_version" ]]; then
    echo "ERROR: unable to determine Sagera version metadata" >&2
    exit 1
fi

if [[ "$spec_version" != "$human_version" ||
      "$spec_version" != "$conf_version" ]]; then
    echo "ERROR: Sagera version mismatch" >&2
    echo "  spec:             $spec_version" >&2
    echo "  sagera-release:   $human_version" >&2
    echo "  release.conf:     $conf_version" >&2
    exit 1
fi

if [[ "$human_fedora" != "$conf_fedora" ]]; then
    echo "ERROR: Fedora base version mismatch" >&2
    echo "  sagera-release:   $human_fedora" >&2
    echo "  release.conf:     $conf_fedora" >&2
    exit 1
fi

echo "Sagera release metadata OK"
echo "  Sagera version: $spec_version"
echo "  Fedora base:    $conf_fedora"

mkdir -p "$TOPDIR"/{BUILD,BUILDROOT,RPMS,SRPMS,SOURCES,SPECS}

rpmbuild \
    --define "_topdir $TOPDIR" \
    --define "_sourcedir $PKG" \
    -ba "$SPEC"