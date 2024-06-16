#!/usr/bin/env bash
#
# ./update_results_to_publish.sh ../ranking-table-tennis/ 2024
# TODO run rtt publish to get latest version of publishing files

DATA_RTT_FOLDER=${1:-'./'}

CURRENT_YEAR=`date +'%Y'`
YEAR=${2:-${CURRENT_YEAR}}

# Commands to bring latest results from rtt execution
find "${DATA_RTT_FOLDER}data_rtt/" -maxdepth 1 -type d -name "S${YEAR}T*" -exec cp -rav {} "./snippets/${YEAR}/" \; || exit 1

# # Move statistics to images and dynamic figures to corresponding folders
mkdir "docs/assets/images/${YEAR}"
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
cp -av ./docs/season/2023/* ./docs/season/${YEAR}/
# Make sure that this year season is hide from navigation
sed -i 's/hide: true/hide: false/g' ./docs/season/*/.pages
sed -i 's/hide: false/hide: true/g' ./docs/season/${CURRENT_YEAR}/.pages
# By default rules will be taken from season 2023
# Copy only if the source file is newer or doesn't exist in the destination
cp -av --update ./snippets/2023/rules.md ./snippets/${YEAR}/
