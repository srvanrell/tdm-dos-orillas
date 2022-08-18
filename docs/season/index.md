# Temporadas anteriores

Accesibles en el [viejo sitio web](https://sites.google.com/site/tdmdosorillas/).

{% for season in seasons[1:] %}

## {{ season.name }}

{% for page in navigation.pages[1:-1] %}

- [{{ page.title }}](../{{ page.url | replace("current", season.name) }})

{% endfor %}

{% endfor %}
