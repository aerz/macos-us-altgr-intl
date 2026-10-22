LAYOUT_BUNDLE := build/us-altgr-intl.bundle

.PHONY: bundle package
bundle: us-altgr-intl.keylayout build/us-altgr-intl.icns custom/Info.plist
	plutil -lint custom/Info.plist
	mkdir -p "$(LAYOUT_BUNDLE)/Contents/Resources"
	cp custom/Info.plist "$(LAYOUT_BUNDLE)/Contents/Info.plist"
	cp us-altgr-intl.keylayout build/us-altgr-intl.icns "$(LAYOUT_BUNDLE)/Contents/Resources/"

build/us-altgr-intl.icns: custom/icon.svg custom/render-icon.swift
	swift custom/render-icon.swift custom/icon.svg build/us-altgr-intl.iconset
	iconutil --convert icns --output "$@" build/us-altgr-intl.iconset

package: bundle CUSTOM.md
	ditto -c -k --keepParent "$(LAYOUT_BUNDLE)" "$(LAYOUT_BUNDLE).zip"
	zip -j "$(LAYOUT_BUNDLE).zip" CUSTOM.md
