# Enable completion
autoload -Uz compinit && compinit

# No nonsense in promt, just the three top (or is it bottom?) directories
PROMPT='%3~ %# '

setopt extended_history
# Drop duplicates first when purging history
setopt hist_expire_dups_first
# Ignore consequent duplicates
setopt hist_ignore_dups

# Don't circle autocomplete options when multiple; instead stop where ambiguous
setopt noautomenu
setopt nomenucomplete

# Autocompleting e.g. 'cd ..' normally doesn't add a slash, which I like; this command changes that
zstyle ':completion:*' special-dirs true
