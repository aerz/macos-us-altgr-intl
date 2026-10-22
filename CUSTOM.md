# Custom layout

`master` follows the original repository. `custom` adds the name `US International – AltGr` and an icon that adapts to light and dark appearances.

## Files

Keep the upstream layout in the root. Custom resources live in `custom/`:

```text
us-altgr-intl.keylayout   Layout with the custom display name
custom/Info.plist        Bundle metadata and template icon setting
custom/icon.svg          Editable icon
custom/render-icon.swift SVG-to-PNG conversion
Makefile                 Bundle and ZIP generation
build/                   Generated icon, bundle, and ZIP, ignored by Git
```

Keep `CFBundleName` and the `KLInfo_<name>` key aligned with the internal `name` in the `.keylayout`.
Keep `TISInputSourceID` stable when updating the bundle.

## Install

Download and extract `us-altgr-intl.bundle.zip` from [Releases](https://github.com/aerz/macos-us-altgr-intl/releases).
Select another keyboard layout before installing.
Use Finder to copy `us-altgr-intl.bundle` to `/Library/Keyboard Layouts/`.
If a previous bundle is present, replace it.
Move any loose `us-altgr-intl.keylayout` and `us-altgr-intl.icns` copies out of that folder.
Log out and log in again.
If needed, add `US International – AltGr` in System Settings > Keyboard > Text Input > Edit.

## Build

The build requires macOS and the Xcode Command Line Tools.

Start from a fresh clone:

```sh
git clone --branch custom https://github.com/aerz/macos-us-altgr-intl.git
cd macos-us-altgr-intl
git branch --track master origin/master
git remote add upstream https://github.com/carjorvaz/macos-us-altgr-intl.git
make bundle
```

Edit `custom/icon.svg` to change the icon. `make bundle` rebuilds it when needed.
Use `make package` to create `build/us-altgr-intl.bundle.zip` with the bundle and this guide.
To install from source, follow the installation steps with the bundle in `build/`.

## Update

Commit your changes before updating. Keep your adjustments on `custom`:

```sh
git fetch upstream
git switch master
git merge --ff-only upstream/master
git switch custom
git merge master
make bundle
```

Resolve any conflicts before building. Install the updated bundle from `build/` through Finder again.
