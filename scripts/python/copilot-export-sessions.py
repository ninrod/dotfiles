#!/usr/bin/env python3
"""Export local GitHub Copilot CLI conversations into Markdown files."""

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Any


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Export each local Copilot CLI conversation to a Markdown file."
    )
    parser.add_argument(
        "destination",
        nargs="?",
        type=Path,
        default=Path.home() / "code/secrets/chats/cli",
        help="Directory in which to write one <session-id>.md file per session.",
    )
    parser.add_argument(
        "--source",
        type=Path,
        default=Path(os.environ.get("COPILOT_HOME", Path.home() / ".copilot"))
        / "session-state",
        help="Copilot session-state directory (default: $COPILOT_HOME/session-state).",
    )
    return parser.parse_args()


def markdown_section(title: str, timestamp: str, content: str) -> str:
    return f"## {title}\n\n_{timestamp}_\n\n{content.rstrip()}\n"


def session_markdown(session_id: str, events_path: Path) -> str:
    start_data: dict[str, Any] = {}
    sections: list[str] = []

    with events_path.open(encoding="utf-8") as events_file:
        for line_number, line in enumerate(events_file, start=1):
            try:
                event = json.loads(line)
            except json.JSONDecodeError as error:
                raise ValueError(
                    f"{events_path}:{line_number}: invalid JSON: {error.msg}"
                ) from error

            event_type = event.get("type")
            data = event.get("data", {})
            if not isinstance(data, dict):
                continue

            if event_type == "session.start":
                start_data = data
                continue

            content = data.get("content")
            if not isinstance(content, str) or not content.strip():
                continue

            if event_type == "user.message":
                sections.append(markdown_section("User", event["timestamp"], content))
            elif event_type == "assistant.message":
                sections.append(markdown_section("Copilot", event["timestamp"], content))

    context = start_data.get("context", {})
    cwd = context.get("cwd") if isinstance(context, dict) else None
    metadata = [f"# Copilot session `{session_id}`"]
    if start_data.get("startTime"):
        metadata.append(f"- Started: {start_data['startTime']}")
    if cwd:
        metadata.append(f"- Working directory: `{cwd}`")

    return "\n".join(metadata) + "\n\n---\n\n" + "\n".join(sections)


def main() -> int:
    arguments = parse_arguments()
    source = arguments.source.expanduser().resolve()
    destination = arguments.destination.expanduser().resolve()

    if not source.is_dir():
        print(f"copilot-export-sessions: source does not exist: {source}", file=sys.stderr)
        return 2
    if destination == source or source in destination.parents:
        print(
            "copilot-export-sessions: destination must not be inside the session-state directory",
            file=sys.stderr,
        )
        return 2

    destination.mkdir(parents=True, exist_ok=True)
    exported = 0
    failures: list[str] = []

    for session_path in sorted(source.iterdir()):
        events_path = session_path / "events.jsonl"
        if not session_path.is_dir() or not events_path.is_file():
            continue
        try:
            markdown = session_markdown(session_path.name, events_path)
            (destination / f"{session_path.name}.md").write_text(
                markdown, encoding="utf-8"
            )
            exported += 1
        except (OSError, ValueError) as error:
            failures.append(str(error))

    print(f"Exported {exported} session(s) to {destination}")
    for failure in failures:
        print(f"copilot-export-sessions: {failure}", file=sys.stderr)
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
