# Maintainer: Nwhy <https://github.com/Nwhy>
pkgname=yihuo-etor-translated
pkgver=1.0.5
pkgrel=1
pkgdesc="YiHuo ETor - English Translation (Torchlight Infinite Tracker)"
arch=('x86_64')
url="https://github.com/Nwhy/TLI-tracker-translated"
license=('MIT')
depends=('electron32')
makedepends=('npm' 'nodejs' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nwhy/TLI-tracker-translated/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

_electron=electron32

prepare() {
  cd "$srcdir/TLI-tracker-translated-main"

  # Extract app.asar
  asar extract resources/app.asar extracted-app
}

build() {
  cd "$srcdir/TLI-tracker-translated-main"

  # Install production dependencies for the extracted app
  cd extracted-app
  npm install --omit=dev
  cd ..
}

package() {
  cd "$srcdir/TLI-tracker-translated-main"

  # Install app files
  install -dm755 "$pkgdir/usr/lib/${pkgname}"
  cp -r extracted-app/* "$pkgdir/usr/lib/${pkgname}/"

  # Install icon
  install -Dm644 build-resources/icon.png \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/yihuo-etor.png"

  # Install desktop file
  install -Dm644 yihuo-etor.desktop \
    "$pkgdir/usr/share/applications/yihuo-etor.desktop"

  # Install launcher script
  install -dm755 "$pkgdir/usr/bin"
  # --no-sandbox is required because Electron apps installed system-wide
  # cannot use the SUID sandbox unless chrome-sandbox is properly configured.
  cat > "$pkgdir/usr/bin/yihuo-etor" << 'EOF'
#!/bin/bash
exec electron32 /usr/lib/yihuo-etor-translated/ --no-sandbox "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/yihuo-etor"

  # Install license
  install -Dm644 LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
