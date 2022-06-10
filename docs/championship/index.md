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

{% for category in categories %}
## {{ category }}

{% for tournament in tournaments %}
=== "{{ tournament.name }}"

    --8<-- "{{ tournament.id }}/Metadata.md"

    --8<-- "{{ tournament.id }}/Primera.md"

{% endfor %}

{% endfor %}

    <!-- [vista para imprimir](../../../../S2022T01/Primera_Torneo_01_2022.md) -->
