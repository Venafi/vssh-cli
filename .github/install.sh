#!/bin/bash
{
    set -e
    SUDO=''
    if [ "$(id -u)" != "0" ]; then
      SUDO='sudo'
      echo "Installing vSSH CLI for all OS users requires elevated access."
      echo "You will be prompted for your password by sudo."
      # clear any previous sudo permission
      sudo -k
    fi

    # run inside sudo
    $SUDO bash <<SCRIPT
  #set -o xtrace

  function fail {
    printf '%s\n' "\$1" >&2
    exit "\${2-1}"
  }

  if [[ ! ":\$PATH:" == *":/usr/local/bin:"* ]]; then
    fail "Your path is missing /usr/local/bin, you need to add this to use this installer."
  fi

  if [ "\$(uname)" == "Darwin" ]; then
    OS=darwin
  elif [ "\$(expr substr \$(uname -s) 1 5)" == "Linux" ]; then
    OS=linux
  else
    fail "This installer is only supported on Linux and macOS. This OS is \$(uname)"
  fi

  ARCH="\$(uname -m)"
  if [ "\$ARCH" == "x86_64" ]; then
    ARCH=amd64
  elif [[ "\$ARCH" == "arm64" ]]; then
    ARCH=arm64
  elif [[ "\$ARCH" == "i686" ]]; then
    ARCH=386
  elif [[ "\$ARCH" == aarch* ]]; then
    ARCH=arm
  else
    fail "unsupported arch: \$ARCH"
  fi

  URL=https://github.com/Venafi/vssh-cli/releases/latest/download/vssh_\${OS}_\${ARCH}.zip
  VSSH_BIN="\$(command -v vssh)" || true

  TMP_FILE=\$(mktemp)
  trap "rm -f \${TMP_FILE}" 0 2 3 15

  echo "Detecting previous installation of vSSH CLI..."
  if [ -z "\${VSSH_BIN}" ]; then
    echo "  Previous installation not detected."
    VSSH_BIN_FOLDER="/usr/local/bin/"
    VSSH_BIN="\${VSSH_BIN_FOLDER}vssh"
  else
    echo "  Previous installation detected (\${VSSH_BIN}). Making backup..."
    VSSH_BIN_FOLDER="\$(dirname "\${VSSH_BIN}")"
    VSSH_BIN_BACK="\${VSSH_BIN}.back"
    mv \${VSSH_BIN} \${VSSH_BIN_BACK} || fail "Unable to back up the previous installation of vSSH CLI."
  fi

  echo "Downloading vSSH CLI from \${URL}"
  if [ \$(command -v curl) ]; then
    curl --silent --fail --location --remote-header-name --output "\${TMP_FILE}" "\${URL}" || fail "Unable to download the vSSH CLI utility."
  else
    wget --content-disposition --quiet --output-document \${TMP_FILE} "\${URL}" || fail "Unable to download the vSSH CLI utility."
  fi

  if [ ! -s "\${TMP_FILE}" ]; then
    fail "error downloading vSSH CLI"
  fi

  echo "Extracting vSSH CLI to \${VSSH_BIN_FOLDER}"
  unzip -q \${TMP_FILE} -d \${VSSH_BIN_FOLDER} || fail "Unable to extract the downloaded archive."

  # set file permissions
  chmod 755 \${VSSH_BIN} || fail "Unable to set file permissions."

  if [ -n "\${VSSH_BIN_BACK}" ]
  then
    echo "Removing the old vSSH CLI version..."
    rm -f \${VSSH_BIN_BACK} || true
  fi


SCRIPT
  # test the vSSH CLI
  LOCATION=$(command -v vssh)
  echo "vSSH CLI installed to $LOCATION"
  vssh version
}
