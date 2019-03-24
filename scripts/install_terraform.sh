#!/usr/bin/env bash

function terraform-install() {
  [[ -f ${HOME}/bin/terraform ]] && echo "`${HOME}/bin/terraform version` already installed at ${HOME}/bin/terraform" && return 0
  OS=$(uname -s)
  LATEST_VERSION=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].version' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'alpha|beta|rc' | tail -1)
  LATEST_URL="https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_${OS,,}_amd64.zip"
  curl ${LATEST_URL} > /tmp/terraform.zip
  mkdir -p ${HOME}/bin
  (cd ${HOME}/bin && unzip /tmp/terraform.zip)
  export PATH=${HOME}/bin:${PATH}
  echo 'export PATH=${HOME}/bin:${PATH}' >> ~/.bashrc

  echo "Installed: `${HOME}/bin/terraform version`"
}

terraform-install