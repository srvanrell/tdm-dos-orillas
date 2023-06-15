#!/usr/bin/env python3

import argparse
import yaml
import pprint
import glob
import os


def main():
    parser = argparse.ArgumentParser(
        description="Update seasons.yaml based on folders in snippets/YEAR."
    )
    parser.add_argument("--year", help="Defines the year to process", type=int)
    args = parser.parse_args()

    seasons_filename = "seasons.yaml"

    # Get current seasons.yaml to modify it
    with open(seasons_filename, "r") as stream:
        seasons = yaml.safe_load(stream)
        print("Original seasons.yaml loaded")
        # pprint.pprint(seasons)

    # List existing folders in snippets/YEAR
    listed_folders = glob.glob(f"snippets/{args.year}/S*T*")
    tids = sorted([os.path.split(folder)[1] for folder in listed_folders], reverse=True)

    # No modifications should be done if there are no tournaments
    if not tids:
        print(f"WARNING: Indicated year ({args.year}) has no tournaments available")
        return

    # Fill seasons.yaml
    season_search = [season["name"] == args.year for season in seasons["seasons"]]
    if any(season_search):
        seasons["seasons"][season_search.index(True)].update(
            {"tournaments": [{"id": f"{tid}", "name": f"Torneo {tid[-2:]}"} for tid in tids]}
        )
    else:
        seasons["seasons"].append(
            {
                "name": args.year,
                "tournaments": [{"id": f"{tid}", "name": f"Torneo {tid[-2:]}"} for tid in tids],
                "categories": ["Primera", "Segunda", "Tercera"],
            }
        )

    # Sort yaml, recent season first
    seasons["seasons"] = sorted(seasons["seasons"], key=lambda s: s["name"], reverse=True)

    print("\nRevised seasons.yaml")
    pprint.pprint(seasons)

    # Write YAML file
    with open(seasons_filename, "w", encoding="utf8") as outfile:
        yaml.dump(seasons, outfile, allow_unicode=True, default_flow_style=False, sort_keys=False, indent=4)


if __name__ == "__main__":
    main()
