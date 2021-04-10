#!/bin/bash
STARTTIME=$(date +%s)
# Constant definitions
RSROOT="$SRCROOT/DinDinnResources"

# Execute SwiftGen to generate L10n
"$PODS_ROOT/SwiftGen/bin/swiftgen" \
strings --templatePath "$RSROOT/Strings/swiftgen-custom-template.stencil" "$RSROOT/Strings/en.lproj/Strings.strings" \
--output "$RSROOT/Strings/Generated/AppStrings.swift"
