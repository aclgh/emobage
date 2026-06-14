kaomoji=(
	"^_^"
	"*o*"
	"*^_^*"
	"=^_^="
	"Y(^_^)Y"
	"QwQ"
	"QAQ"
	"T_T"
	">o<"
	"=_="
	"@_@"
	"o_O"
	"-_-"
	"-_-||"
	"-_-#"
	"(ToT)/~~~"
	"\(^o^)/"
	"(>_<)"
	"(^_^)/"
	";_;"
	"(=_=;)"
	"(>o<;)"
	"\(O_O)/"
	"(T_T)"
	"(;_;)"
	"(*_*)"
	"(O_o)"
	"(x_x)"
	"\(-_-)/"
	":D"
	"XD"
	"<3"
	":3"
	";P"
	":O"
	"D:"
	":|"
	">_>"
	"<_<"
	"(^^)"
	"(^^;)"
	"orz"
	"OTL"
)

display_kaomoji() {
  (
		local kaomoji_count=${#kaomoji[@]}
		(( kaomoji_count == 0 )) && return

		local random_index=$((RANDOM % kaomoji_count + 1))
		local chosen_kaomoji="${kaomoji[random_index]}"
		printf "\e]1337;SetBadgeFormat=%s\a" "$(echo -n "$chosen_kaomoji" | base64)"
  ) &!
}

clear_badge() {
  printf "\e]1337;SetBadgeFormat=%s\a" "$(printf '' | base64)"
}

preexec() {
	local -a clear_badge_cmd_patterns
	local pattern

	clear_badge_cmd_patterns=(
		${(z)${EMOBAGE_CLEAR_BADGE_CMDS:-"nvim* vim* less* man*"}}
	)

	for pattern in "${clear_badge_cmd_patterns[@]}"; do
		[[ -z "$pattern" ]] && continue
		if [[ "$1" == ${~pattern} ]]; then
			clear_badge
			return
		fi
	done
}

precmd() {
  display_kaomoji
}
