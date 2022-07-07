# Partidos {{ season_name }}

!!! note ""

    Aquí podes ver los partidos y los resultados torneo a torneo.

{% for season in seasons %}
 {% if season.name == season_name %}
  {% for tournament in season.tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Metadata.md"

    --8<-- "{{ season.name }}/{{ tournament.id }}/Partidos.md"

  {% endfor %}
 {% endif %}
{% endfor %}

Nota: en ocasiones el resultado de un partido no es informado a la mesa de control y sólo se asigna un 3 a 0 para el ganador.
