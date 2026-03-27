"""iTerm2 status bar component: count of Claude Code sessions waiting for input.

Reads ~/.claude/pending-prompts, written by garrow-custom plugin hooks
(~/work/dotfiles/claude/hooks/pending-prompt-{add,remove,cleanup}.sh).
"""

import os
import iterm2

PENDING_FILE = os.path.expanduser("~/.claude/pending-prompts")


def get_pending_count():
    try:
        with open(PENDING_FILE, "r") as f:
            lines = [l for l in f.readlines() if l.strip()]
            return len(lines)
    except FileNotFoundError:
        return 0


async def main(connection):
    component = iterm2.StatusBarComponent(
        short_description="Claude Pending",
        detailed_description="Number of Claude Code sessions waiting for input",
        knobs=[
            iterm2.CheckboxKnob("Hide when zero", False, "hide_zero"),
        ],
        exemplar="🤖 2",
        update_cadence=2,
        identifier="com.garrow.claude-pending",
    )

    @iterm2.StatusBarRPC(component)
    async def claude_pending_coroutine(knobs):
        count = get_pending_count()
        hide_zero = knobs.get("hide_zero", False)
        if count == 0 and hide_zero:
            return ""
        if count == 0:
            return "🤖 –"
        return f"🤖 {count}"

    await component.async_register(connection, claude_pending_coroutine)


iterm2.run_forever(main)
