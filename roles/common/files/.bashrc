
HOMEDIR="$(cd "$( dirname "${BASH_SOURCE[0]}")">/dev/null 2>&1 && pwd)"

# Load files in .bashrc.d
for F in ${HOMEDIR}/.bashrc.d/*; do
    source "${F}"
done
