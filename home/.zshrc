source "~/.antigen/antigen.zsh"

files=(config variables vendor aliases)
for f in $files; do
	source ~/.zsh/"$f"
done
