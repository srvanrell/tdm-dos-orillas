# Estadísticas {{ season_name }}

{% for season in seasons %}
 {% if season.name == season_name %}

## Nivel de Juego: torneo a torneo

Evolución del nivel de juego a medida que avanza el campeonato.

--8<-- "{{ season.name }}/rating{{ season_name }}.html"

## Campeonato: torneo a torneo

  {% for category in season.categories %}

### {{ category }}

Evolución de los puntos de campeonato a medida que avanza el año.

--8<-- "{{ season.name }}/championship{{ season_name }}{{ category }}.html"

  {% endfor %}

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
