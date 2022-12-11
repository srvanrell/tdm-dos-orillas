#!/usr/bin/env zsh
#
# TODO run rtt publish to get latest version of publishing files

YEAR=${1:-2022}

# Commands to bring latest results from rtt execution
rsync -avz ../ranking-table-tennis/data_rtt/S${YEAR}T* ./snippets/${YEAR}/

# Move statistics to images corresponding folder
folders=(`ls -d1X snippets/${YEAR}/S${YEAR}T*/`)
for folder in "${folders[@]}"
do
    echo "'$folder'"
    mv -v "${folder}Estadisticas_Acumulado.png" "docs/assets/images/${YEAR}/Estadisticas_Acumulado.png"
    mv -v "${folder}Estadisticas_Por_Torneo.png" "docs/assets/images/${YEAR}/Estadisticas_Por_Torneo.png"
done

./update_season_yaml.py --year ${YEAR}
