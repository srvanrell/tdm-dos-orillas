# TODO run rtt publish to get latest version of publishing files
# Use zsh to run this script

# Commands to bring latest results from rtt execution
rsync -avz ../ranking-table-tennis/data_rtt/S2022T* ./snippets/2022/

# Move statistics to images corresponding folder
folders=(`ls -d1X snippets/2022/S2022T*/`)
for folder in "${folders[@]}"
do
    echo "'$folder'"
    mv -v "${folder}Estadisticas_Acumulado.png" "docs/assets/images/2022/Estadisticas_Acumulado.png"
    mv -v "${folder}Estadisticas_Por_Torneo.png" "docs/assets/images/2022/Estadisticas_Por_Torneo.png"
done
