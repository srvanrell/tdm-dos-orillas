# Historial por Jugador - {{ season_name }}

{% for season in seasons %}
 {% if season.name == season_name %}

--8<-- "{{ season.tournaments[0].id }}/Historiales_{{ season.name }}.md"

 {% endif %}
{% endfor %}
