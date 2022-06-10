---
tournaments:
  - id: S2022T02
    name: Torneo 02
  - id: S2022T01
    name: Torneo 01
---

# Nivel de Juego y Categorías

## Nivel de Juego: torneo a torneo

!!! note ""

    Aquí podes ver el nivel de juego y la categoría de cada jugador luego de cada torneo. 
    El cambio respecto del torneo anterior se indica entre paréntesis. 
    Aquellos jugadores que no han participado durante el año pueden verificar si tienen un nivel de juego asignado en la hoja Inicial 2022.

{% for tournament in tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ tournament.id }}/Metadata.md"

    --8<-- "{{ tournament.id }}/Nivel_de_Juego.md"

{% endfor %}

=== "Inicial"

    --8<-- "{{ tournaments[0].id }}/Nivel_de_Juego_Inicial.md"

## Detalles de la asignación de puntos

!!! note ""

    Aquí podes ver el detalle de asignación de puntos de nivel de juego, torneo a torneo. 
    En el [reglamento](./regulation.md) se explican las consideraciones para asignar puntos de campeonato y los cálculos de nivel de juego.

{% for tournament in tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ tournament.id }}/Metadata.md"

    --8<-- "{{ tournament.id }}/Log_Rating.md"

{% endfor %}

!!! note ""

    Los scripts usados para realizar todos los cálculos están en [github]({{ config.repo_url }}).
