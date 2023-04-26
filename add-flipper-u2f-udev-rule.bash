#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Add the udev rule iff it does not exist in the file
if ! sudo grep '# Flipper Zero U2F' /etc/udev/rules.d/70-snap.firefox.rules; then
  cat <<- EOF | sudo tee --append /etc/udev/rules.d/70-snap.firefox.rules
# u2f-devices
# Flipper Zero U2F
SUBSYSTEM=="hidraw", KERNEL=="hidraw*", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5741", TAG+="snap_firefox_firefox"
	EOF

  echo 'Added Flipper Zero U2F rule 🐬'
else
  echo 'Flipper Zero U2F rule already added, nothing to do 🙃'
fi
