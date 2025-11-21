#!/usr/bin/env bash
#
# Previous to this script you must run rtt publish to get latest version of publishing files
# ./update_results_to_publish.sh ../ranking-table-tennis/ 2024

DATA_RTT_FOLDER=${1:-'./'}

CURRENT_YEAR=`date +'%Y'`
YEAR=${2:-${CURRENT_YEAR}}

# Commands to bring latest results from rtt execution
# Function to copy directories while maintaining structure
copy_directories() {
    local src_dir=$1
    local dest_dir=$2
    local year=$3

    find "${src_dir}" -maxdepth 1 -type d -name "S${year}T*" | while read -r dir; do
        dest_subdir="${dest_dir}/$(basename "${dir}")"
        mkdir -p "${dest_subdir}"
        cp -rav "${dir}/." "${dest_subdir}/"
    done
}

# Commands to bring latest results from rtt execution
copy_directories "${DATA_RTT_FOLDER}data_rtt/" "./snippets/${YEAR}" "${YEAR}" || exit 1

# Move statistics to images and dynamic figures to corresponding folders
mkdir -p "docs/assets/images/${YEAR}"
folders=(`ls -d1 snippets/${YEAR}/S${YEAR}T*/`)
for folder in "${folders[@]}"
do
    echo "'$folder'"
    mv -v "${folder}Estadisticas_Acumulado.png" "docs/assets/images/${YEAR}/Estadisticas_Acumulado.png"
    mv -v "${folder}Estadisticas_Por_Torneo.png" "docs/assets/images/${YEAR}/Estadisticas_Por_Torneo.png"
    mv -v ${folder}*.html "${folder}/.."
done

# Update seasons.yaml and docs folders (imitate 2023)
./update_season_yaml.py --year ${YEAR}
mkdir -p "./docs/season/${YEAR}/"
cp -av ./docs/season/2023/* ./docs/season/2023/.* ./docs/season/${YEAR}/
# Make sure that this year season is hide from navigation
sed -i 's/hide: true/hide: false/g' ./docs/season/*/'.pages'
sed -i 's/hide: false/hide: true/g' ./docs/season/${CURRENT_YEAR}/.pages
# By default rules will be taken from season 2023
# Copy only if the source file is newer or doesn't exist in the destination
cp -av --update ./snippets/2023/rules.md ./snippets/${YEAR}/
