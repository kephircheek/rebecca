# Backup

Backuped configs:
- vim
- vifm
- ohmyzsh
- tmux

Load backuped configs with
```
make all
```

## Example: load app backup

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
sudo apt install vifm
```

## python linter

Install on mac:
```bash
pip intall pylint flake8
```

Install on ubuntu:
```bash
sudo apt install pylint3 python3-flake8
```
