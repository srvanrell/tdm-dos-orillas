# Estadísticas {{ season_name }}

{% for season in seasons %}
 {% if season.name == season_name %}

## Participación por torneo

Cantidad de jugadores que participaron en cada torneo.
Si un jugador jugó dos categorías se cuenta dos veces (una vez en cada categoría).

![Por TOrneo](../../assets/images/{{ season_name }}/Estadisticas_Por_Torneo.png)

## Participación acumulada por categoría

Cantidad de jugadores que se han sumado a cada categoría.
Cuenta a los jugadores distintos que participaron en al menos un torneo durante el año.

![Acumulado](../../assets/images/{{ season_name }}/Estadisticas_Acumulado.png)

 {% endif %}
{% endfor %}
