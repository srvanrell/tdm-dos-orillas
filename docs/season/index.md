# Temporadas anteriores

{% for season in seasons %}

## {{ season.name }}

{% for page in navigation.pages[1:-1] %}

- [{{ page.title }}](../{{ page.url | replace("current", season.name) }})

{% endfor %}

{% endfor %}
