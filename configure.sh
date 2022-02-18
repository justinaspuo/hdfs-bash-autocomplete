#!/bin/bash

REAL_PATH="$(realpath "$0")"
SCRIPT_DIR="$(cd "$(dirname "${REAL_PATH}")" && pwd -P)"

hdfs_completion_file_name="hdfs_autocomplete"
global_completion_file="${HOME}/.bash_completion"

[ ! -d "${HOME}/.bash_completion.d" ] && mkdir "$HOME/.bash_completion.d"

cp "${SCRIPT_DIR}/${hdfs_completion_file_name}" "${HOME}/.bash_completion.d/"

[ ! -f "${global_completion_file}" ] && touch ${global_completion_file}

source_completion_files_code='for f in ~/.bash_completion.d/*; do source $f; done'
check_if_already_configured=`grep -Fx "${source_completion_files_code}" "${global_completion_file}"`

if [ -z "${check_if_already_configured}" ]; then
  echo -e "${source_completion_files_code}" >> ${global_completion_file}
fi

echo "HDFS autocomplete configured."
echo "Restart your session to make changes effective!"

