# Reglamento {{ season_name }} y armado de llaves

{% for season in seasons %}
 {% if season.name == season_name %}

--8<-- "{{ season.name }}//rules.md"

 {% endif %}
{% endfor %}

## Armado de llaves

[Descargar PDF](../../assets/pdfs/armado_llaves.pdf)
