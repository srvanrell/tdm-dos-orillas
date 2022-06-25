# Campeonato {{ season_name }}

!!! note ""

    Aquí podés ver como viene el **campeonato** en cada una de las **categorías**. 
    Los **primeros 8 jugadores** en cada categoría son quiénes clasificarán a la **copa de maestros** a fin de año.

{% for season in seasons %}
 {% if season.name == season_name %}
  {% for category in season.categories %}

## {{ category }}

   {% for tournament in season.tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ tournament.id }}/Metadata.md"

    --8<-- "{{ tournament.id }}/Primera.md"

   {% endfor %}
  {% endfor %}
 {% endif %}
{% endfor %}
