# Reglamento {{ season_name }}

{% for season in seasons %}
 {% if season.name == season_name %}

--8<-- "{{ season.name }}//rules.md"

 {% endif %}
{% endfor %}
