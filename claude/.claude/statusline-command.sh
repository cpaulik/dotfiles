#!/usr/bin/env bash
# Claude Code status line — gruvbox dark + powerline style

input=$(cat)

# --- Gruvbox dark palette (truecolor) ---
# Usage: fg "R;G;B" / bg "R;G;B"
fg() { printf '\033[38;2;%sm' "$1"; }
bg() { printf '\033[48;2;%sm' "$1"; }
reset() { printf '\033[0m'; }

# Gruvbox colors
BG1="60;56;54"      # #3c3836
BG2="80;73;69"      # #504945
BG3="102;92;84"     # #665c54
FG1="235;219;178"   # #ebdbb2
FG4="168;153;132"   # #a89984
YELLOW2="250;189;47" # #fabd2f
AQUA2="142;192;124"  # #8ec07c
BLUE2="131;165;152"  # #83a598
ORANGE2="254;128;25"  # #fe8019

SEP=$'\ue0b0'  # powerline right arrow (U+E0B0)

# --- Gather data ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
display_dir="${cwd/#$HOME/~}"

git_branch=""
git_status=""
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
    git_branch=$(git -C "$cwd" branch --show-current 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    if [ -n "$git_branch" ] && ! git -C "$cwd" diff-index --quiet HEAD -- 2>/dev/null; then
        git_status="*"
    fi
fi

worktree_name=$(echo "$input" | jq -r '.worktree.name // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# --- Build statusline ---
out=""

# Segment 1: directory (bg3 background, fg1 text)
out+="$(bg "$BG3")$(fg "$FG1") $display_dir "

if [ -n "$git_branch" ]; then
    # Separator: bg3 -> bg2
    out+="$(fg "$BG3")$(bg "$BG2")${SEP}"
    # Segment 2: git branch (bg2 background, yellow text)
    out+="$(fg "$YELLOW2")$(bg "$BG2")  $git_branch$git_status "
    prev_bg="$BG2"
else
    prev_bg="$BG3"
fi

if [ -n "$worktree_name" ]; then
    # Separator: prev -> bg1
    out+="$(fg "$prev_bg")$(bg "$BG1")${SEP}"
    # Segment 3: worktree (bg1 background, aqua text)
    out+="$(fg "$AQUA2")$(bg "$BG1")  $worktree_name "
    prev_bg="$BG1"
fi

if [ -n "$remaining" ]; then
    # Separator: prev -> bg1 (or new segment)
    if [ "$prev_bg" != "$BG1" ]; then
        out+="$(fg "$prev_bg")$(bg "$BG1")${SEP}"
    else
        out+="$(fg "$FG4")$(bg "$BG1")| "
    fi
    # Context percentage with color coding
    if [ "${remaining%.*}" -le 20 ] 2>/dev/null; then
        ctx_color="$ORANGE2"
    else
        ctx_color="$BLUE2"
    fi
    out+="$(fg "$ctx_color")$(bg "$BG1") ${remaining}% "
    prev_bg="$BG1"
fi

# Final separator: last bg -> terminal default
out+="$(reset)$(fg "$prev_bg")${SEP}$(reset)"

printf '%s' "$out"
