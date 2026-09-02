#!/usr/bin/env bash
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel)"
PKG="$ROOT/packages/sagera-release"
TOPDIR="$ROOT/build/rpmbuild"

mkdir -p "$TOPDIR"/{BUILD,BUILDROOT,RPMS,SRPMS,SOURCES,SPECS}

rpmbuild \
    --define "_topdir $TOPDIR" \
    --define "_sourcedir $PKG" \
    -ba "$PKG/sagera-release.spec"
