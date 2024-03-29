#!/usr/bin/env zsh
#
# TODO run rtt publish to get latest version of publishing files

CURRENT_YEAR=`date +'%Y'`
YEAR=${1:-${CURRENT_YEAR}}

# Commands to bring latest results from rtt execution
rsync -avz ../ranking-table-tennis/data_rtt/S${YEAR}T* ./snippets/${YEAR}/ || exit 1

# Move statistics to images and dynamic figures to corresponding folders
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
rsync -avz ./docs/season/2023/ ./docs/season/${YEAR}/
# Make sure that this year season is hide from navigation
sed -i 's/hide: true/hide: false/g' ./docs/season/*/.pages
sed -i 's/hide: false/hide: true/g' ./docs/season/${CURRENT_YEAR}/.pages
# By default rules will be taken from season 2023
rsync -avz --update ./snippets/2023/rules.md ./snippets/${YEAR}/ 
