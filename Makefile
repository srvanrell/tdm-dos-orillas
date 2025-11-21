update-results:
	uv run rtt preprocess --offline
	uv run rtt compute
	uv run rtt publish --last
	uv run ./update_results_to_publish.sh

installuv:
	uv sync

serve:
	uv run mkdocs serve