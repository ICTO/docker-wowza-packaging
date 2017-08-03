#!/bin/bash
set -e

WOWZA_INSTALLER_URL="https://www.wowza.com/downloads/WowzaStreamingEngine-${WOWZA_VERSION//./-}/WowzaStreamingEngine-${WOWZA_VERSION}-linux-x64-installer.run"
WOWZA_INSTALLER_FILE="WowzaStreamingEngine.run"

cd /app

# download wowza installer
wget "${WOWZA_INSTALLER_URL}" -O "${WOWZA_INSTALLER_FILE}"
chmod +x "${WOWZA_INSTALLER_FILE}"
