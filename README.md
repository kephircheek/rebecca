# Backup

Backuped configs:
- vim
- vifm
- ohmyzsh
- tmux

## Usage:

1. Cloning repo.  **Warning: Use recursive cloning**
```
git clone --recurse-submodules https://github.com/kephircheek/backup.git
```

2. Install dependencies
- vim > 8.0
- vifm > 0.10.0
- zsh
- tmux > 2.4

3. Load backuped configs with
```
make all
```

4. Install plugins for vim, tmux and other.

- in vim run `:PlugInstall`
- in tmux press `Ctrl-b I`(capital I) see [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

## Example: load one app backup

Restore vim configs from backup
```bash
make vim
```

## Dependencies

### vim (>=8.0)

Install on mac:
```bash
brew install macvim
```

Install on ubuntu:
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```

### vifm

Install on mac:
```bash
brew install vifm
```

Install on ubuntu:
```bash
...
```

### Python linter for vim

Install on mac:
```bash
pip intall pylint flake8
```

Install on ubuntu:
```bash
sudo apt install pylint3 python3-flake8
```

### tmux
Press `Ctrl-b I` to install plugins (see Tmux Plugin Manager)



