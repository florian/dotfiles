files=(config plugins variables vendor aliases functions) 
for f in $files; do
	source ~/.zsh/"$f"
done
