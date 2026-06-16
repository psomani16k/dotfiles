function fish_prompt
    set -l last_status $status

    # Terafox palette
    set -l dark 152528
    set -l fg_color e6eaea
    set -l comment 6d7f8b
    set -l red e85c51
    set -l green 7aa4a1
    set -l cyan a1cdd8
    set -l sel 293e40

    # Segment colors
    set -l seg1_bg $cyan
    set -l seg1_fg $dark
    set -l seg2_bg $green
    set -l seg2_fg $fg_color
    set -l seg3_bg $sel
    set -l seg3_fg $comment

    echo

    # ── Directory segment ──
    set_color $seg1_bg
    echo -n \ue0b6
    set_color $seg1_fg --background $seg1_bg
    echo -n " $(prompt_pwd) "

    # ── Git branch segment (conditional) ──
    set -l branch (command git branch --show-current 2>/dev/null)
    if test -n "$branch"
        set_color $seg1_bg --background $seg2_bg
        echo -n \ue0b4
        set_color $seg2_fg --background $seg2_bg
        echo -n "  $branch "
        set_color $seg2_bg --background $seg3_bg
        echo -n \ue0b4
    else
        set_color $seg1_bg --background $seg3_bg
        echo -n \ue0b4
    end

    # ── Time segment ──
    set_color $seg3_fg --background $seg3_bg
    echo -n "  $(date +%H:%M) "
    set_color $seg3_bg --background normal
    echo -n \ue0b4

    # ── Character prompt ──
    echo
    if test $last_status -eq 0
        set_color $green
    else
        set_color $red
    end
    echo -n '❯ '
    set_color normal
end

function fish_mode_prompt
end
