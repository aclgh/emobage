emobage
===

A [zim module](https://github.com/zimfw/zimfw) that randomly shows a cute kaomoji in your iTerm2 [badge](https://iterm2.com/documentation-badges.html).

![image](https://7365f31.webp.li/docs/1775246183.png)

Behavior
--------

  * On every prompt render (`precmd`), it randomly picks one kaomoji from the built-in `kaomoji` list and writes it to the badge.
  * Before command execution (`preexec`), it clears the badge when the command matches configured patterns.
  * Default clear patterns are: `nvim*`, `vim*`, `less*`, `man*`.

Advanced settings
-----------------

You can override the default clear list using an environment variable:

	export EMOBAGE_CLEAR_BADGE_CMDS='nvim* vim* less* man*'

This variable accepts space-separated patterns and supports zsh patterns.

For example, to also clear on `bat` and `fzf`:

	export EMOBAGE_CLEAR_BADGE_CMDS='nvim* vim* less* man* bat* fzf*'

It is recommended to put this line in `~/.zshrc`, before module initialization.

Requirements
------------

  * iTerm2 (badge escape sequence: `\e]1337;SetBadgeFormat=...\a`)
  * `base64` command available (included by default on macOS)

Installation (zimfw)
--------------------

Add this to `~/.zimrc`:

	zmodule aclgh/emobage