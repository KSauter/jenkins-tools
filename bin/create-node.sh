#!/bin/sh -e

DIRECTORY=$(dirname "${0}")
SCRIPT_DIRECTORY=$(cd "${DIRECTORY}" || exit 1; pwd)

usage()
{
    echo "Local usage: ${0} NEW_NODE_NAME NODE_CONFIGURATION"
}

# shellcheck source=/dev/null
. "${SCRIPT_DIRECTORY}/../lib/jenkins.sh"
validate_jenkins_client
NEW_NODE_NAME="${1}"
NODE_CONFIGURATION="${2}"

if [ "${NEW_NODE_NAME}" = "" ] || [ "${NODE_CONFIGURATION}" = "" ]; then
    usage

    exit 1;
fi

${JENKINS_COMMAND} create-node "${NEW_NODE_NAME}" < "${NODE_CONFIGURATION}"
