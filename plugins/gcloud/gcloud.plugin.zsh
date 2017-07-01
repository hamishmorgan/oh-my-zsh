#!/usr/bin/env zsh

__gcloud() {

  local GCLOUD_INSTALL_DIR_CANDIDATES=(
    '/opt/google-cloud-sdk' \
    "$HOME/opt/google-cloud-sdk"
  )

  local GCLOUD_INCLUDES=(
    'completion' \
    'path'
  )

  # Attempt to locate Google Cloud SDK in the command path
  find_in_path() {
    command -v gcloud >/dev/null 2>&1 || return -1
    command gcloud info --format="value(installation.sdk_root)"
  }

  # Attempt to locate Google Cloud SDK in common install locations
  find_in_common_install_dirs() {
    for dir in $GCLOUD_INSTALL_DIR_CANDIDATES; do
      if [ -f "$dir/bin/gcloud" ]; then
        $dir/bin/gcloud info --format="value(installation.sdk_root)"
        return
      fi
    done
    return -1
  }

  # Attempt to locate Google Cloud SDK
  find_gcloud() {
    find_in_path \
      || find_in_common_install_dirs \
      || >&2 echo "Failed to locate gcloud sdk root. Please set GOOGLE_CLOUD_SDK_HOME in your .zshrc"
  }

  # Load Google Cloud SDK includes from given install dir
  source_includes() {
    if [ ! -z "$1" ]; then
      for include in ${GCLOUD_INCLUDES}; do
        source "$1/$include.zsh.inc"
      done
    fi
  }

  export CLOUDSDK_ROOT_DIR=${CLOUDSDK_ROOT_DIR:-$(_find_gcloud)}

  source_includes ${CLOUDSDK_ROOT_DIR}
}

__gcloud
