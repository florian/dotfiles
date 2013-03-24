files=(config plugins variables vendor aliases functions tmux)
for f in $files; do
	source ~/.zsh/"$f"
done
