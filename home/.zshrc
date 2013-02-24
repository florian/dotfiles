files=(config plugins variables vendor aliases)
for f in $files; do
	source ~/.zsh/"$f"
done
