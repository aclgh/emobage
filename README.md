emobage
===

为你的 Iterm2 终端的 Badge 随机展示一个可爱的颜文字

Behavior
--------

  * 每次进入提示符（`precmd`）时，从内置 `kaomoji` 列表随机选择一个颜文字并写入 Badge。
  * 执行命令前（`preexec`）会根据匹配规则清空 Badge
  * 默认会清空 Badge 的命令模式：`nvim*`、`vim*`、`less*`、`man*`

Advanced settings
-----------------

你可以通过环境变量覆盖默认的 clear 列表：

	export EMOBAGE_CLEAR_BADGE_CMDS='nvim* vim* less* man*'

这个变量使用空格分隔多个模式，支持 zsh pattern

例如，增加 `bat` 与 `fzf`：

	export EMOBAGE_CLEAR_BADGE_CMDS='nvim* vim* less* man* bat* fzf*'

建议把这行放在 `~/.zshrc` 里，并且位于初始化模块之前

Requirements
------------

  * iTerm2（Badge escape sequence: `\e]1337;SetBadgeFormat=...\a`）
  * `base64` 命令可用（macOS 默认可用）

Installation (zimfw)
--------------------

在 `~/.zimrc` 中加入：

	zmodule aclgh/emobage