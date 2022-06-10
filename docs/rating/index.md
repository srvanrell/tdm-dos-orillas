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
