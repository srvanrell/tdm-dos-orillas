update-results:
	uv run rtt preprocess --offline
	uv run rtt compute
	uv run rtt publish --last
	uv run ./update_results_to_publish.sh

install:
	uv sync

serve:
	uv run mkdocs serve -o