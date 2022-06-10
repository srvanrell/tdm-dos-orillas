---
tournaments:
  - id: S2022T02
    name: Torneo 02
  - id: S2022T01
    name: Torneo 01

categories:
  - Primera
  - Segunda
  - Tercera
---

# Campeonato

!!! note ""

    Aquí podés ver como viene el **campeonato** en cada una de las **categorías**. 
    Los **primeros 8 jugadores** en cada categoría son quiénes clasificarán a la **copa de maestros** a fin de año.

{% for category in categories %}

## {{ category }}

{% for tournament in tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ tournament.id }}/Metadata.md"

    --8<-- "{{ tournament.id }}/Primera.md"

{% endfor %}
{% endfor %}

    <!-- [vista para imprimir](../../../../S2022T01/Primera_Torneo_01_2022.md) -->
