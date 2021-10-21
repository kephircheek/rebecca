# Rebecca

Backuped configs (make targets):
- [vim](https://www.vim.org/)
- [vifm](https://vifm.info/)
- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [tmux](https://github.com/tmux/tmux/wiki)

## Load backup:

1. Cloning repo. **Warning: Use recursive cloning.**
```bash
$ git clone --recurse-submodules https://github.com/kephircheek/rebbeca.git
$ cd backup
```

2. Install dependencies
- vim > 8.0
- vifm > 0.10.0
- zsh
- tmux > 2.4

```bash
# MacOS
$ brew install $(cat deps/macos/requirements.brew)
$ pip install -r deps/macos/requirements.pip
```

```bash
# Ubuntu
$ ./deps/ubuntu/install.sh
```
3. Load backuped configs with
```
$ make all
```

4. Install plugins for vim and tmux.

- in vim run `:PlugInstall`
- install YouCompleteMe
```bash
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all
```
- in tmux press `Ctrl-b I` (capital I) see [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

## Examples
- Delete all configs
```bash
$ make clean
```

- Delete vim configs
```bash
$ make clean_vim
```

- Restore vim configs from backup
```bash
$ make vim
```

## Features
- Automatically start tmux on a remote login
Just append next line to your shell "run command" file (`.bashrc`):
```
source ~/.tmux/autostart.sh
```

## Refs
[Clipboard sharing on Mac OS X is easy](https://gist.github.com/romainl/96180b5b8e7722a7428c)

