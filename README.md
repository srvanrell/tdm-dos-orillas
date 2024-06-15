# Tenis De Mesa - Dos Orillas - Web

The repo to publish tournaments and rankings at https://srvanrell.github.io/tdm-dos-orillas/

## Installation

It will install all required dependencies to update results and to serve the web locally.
Main dependencies are [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) for the site 
and [ranking-table-tennis](https://github.com/srvanrell/ranking-table-tennis) for

```bash
make install
```

## Update tournaments and rankings data

```bash
make update
```

Tournaments and rankings data can be updated to:
1. Serve the web locally
2. or to update published results (by pushing to master)

To update results of a year different from current:

```bash
./update_results_to_publish.sh <YYYY>
```

## Serve the web locally

```bash
make run
```
