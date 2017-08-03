#!/bin/bash
set -e

WOWZA_KEY=${WOWZA_KEY:-}

check_and_install_wowza() {
  echo "Checking if Wowza Streaming Engine is installed..."
  if [[ -e /usr/local/WowzaStreamingEngine ]]; then
    echo "Installation found"
    return
  fi

  echo "No installation found"
  echo "Installing Wowza..."

  if [[ ${WOWZA_ACCEPT_LICENSE} != yes ]]; then
    echo "ERROR: "
    echo "  Please accept the Wowza EULA by specifying 'WOWZA_ACCEPT_LICENSE=yes'"
    echo "  Visit https://www.wowza.com/legal to read the Licensing Terms."
    echo "  Aborting..."
    exit 1
  fi

  if [[ -z ${WOWZA_KEY} && ! -f /usr/local/WowzaStreamingEngine/conf/Server.license ]]; then
    echo "ERROR: "
    echo "  Please specify your Wowza Streaming Engine license key using"
    echo "  the WOWZA_KEY environment variable."
    echo "  Cannot continue without a license. Aborting..."
    exit 1
  fi

  # setting up licences
  sed -i "s/xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxxxxxxxxx/${WOWZA_KEY}/g" /app/interaction.exp

  # install Wowza
  /app/interaction.exp

}

package_wowza() {
    # setting up version for packaging
    sed -i "s/X.X.X/${WOWZA_VERSION}/g" /packaging/wowza-package.sh

    cd /packaging && ./wowza-package.sh
}

check_and_install_wowza
package_wowza
