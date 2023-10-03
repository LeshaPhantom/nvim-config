# Nvim-config
Make a backup of your current Neovim files:
```sh 
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```
Clone the starter
```sh
git clone https://github.com/LeshaPhantom/nvim-config ~/.config/nvim
``` 
Remove the `.git` folder, so you can add it to your own repo later
```sh
rm -rf ~/.config/nvim/.git
```

## If Windows
Install g++
