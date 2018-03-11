files=(config plugins variables vendor aliases functions) 
for f in $files; do
	source ~/.zsh/"$f"
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
