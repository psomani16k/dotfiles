#!/usr/bin/env bash
# Kitty launcher for strict, always-named zellij sessions.
#
# Behaviour when a terminal starts:
#   - Already inside zellij (nested)  -> just run the shell.
#   - An open session exists          -> attach to the most recently opened one.
#   - No open session                 -> prompt for a name with raddio's
#                                        `new-zellij-session` station, then attach
#                                        to the session that prompt creates.
#
# Sessions are never created unnamed: the only creation path is the raddio prompt.

# Nested inside a zellij session already (e.g. a pane spawning a shell): don't recurse.
if [ -n "$ZELLIJ" ]; then
    exec fish
fi

# Name of the most recently opened *active* session (EXITED/resurrectable ones excluded).
latest_session() {
    zellij list-sessions --no-formatting --reverse 2>/dev/null \
        | grep -v 'EXITED' \
        | head -n1 \
        | awk '{print $1}'
}

session="$(latest_session)"

if [ -z "$session" ]; then
    # No open sessions: ask for a name. The station creates the session in the
    # background; its `switch-session` step is a no-op here (we aren't in zellij yet).
    raddio run new-zellij-session
    session="$(latest_session)"
fi

if [ -n "$session" ]; then
    exec zellij attach "$session"
fi

# Prompt was dismissed without naming a session: fall back to a plain shell.
exec fish
