# Nivel de Juego y Categorías - {{ season_name }}

## Nivel de Juego: torneo a torneo

!!! note ""

    Aquí podes ver el nivel de juego y la categoría de cada jugador luego de cada torneo. 
    El cambio respecto del torneo anterior se indica entre paréntesis. 
    Aquellos jugadores que no han participado durante el año pueden verificar si tienen un nivel de juego asignado en la hoja Inicial.

{% for season in seasons %}
 {% if season.name == season_name %}
  {% for tournament in season.tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Metadata.md"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Nivel_de_Juego.md"

  {% endfor %}

=== "Inicial"

    --8<-- "{{ season.name }}/{{ season.tournaments[0].id }}/Nivel_de_Juego_Inicial.md"

## Detalles de la asignación de puntos

!!! note ""

    Aquí podes ver el detalle de asignación de puntos de nivel de juego, torneo a torneo. 
    En el [reglamento](./regulation.md) se explican las consideraciones para asignar puntos de campeonato y los cálculos de nivel de juego.

  {% for tournament in season.tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Metadata.md"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Log_Rating.md"

  {% endfor %}

 {% endif %}
{% endfor %}

!!! note ""

    Los scripts usados para realizar todos los cálculos están en [github]({{ config.repo_url }}).
