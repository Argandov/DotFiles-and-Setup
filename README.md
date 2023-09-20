# Get .Vimrc && .Bashrc files:
1. Get .vimrc and INstall VIM Plugins:
```bash
curl -s https://raw.githubusercontent.com/Argandov/my_dotfiles/master/get-my-dotfiles.sh | bash -s -- --vimrc
```

3. Get .bashrc:
```bash
curl -s https://raw.githubusercontent.com/Argandov/my_dotfiles/master/get-my-dotfiles.sh | bash -s -- --bashrc
```
4. Get Both:
```bash
curl -s https://raw.githubusercontent.com/Argandov/my_dotfiles/master/get-my-dotfiles.sh | bash -s -- --all
```
# TMUX

If not installed, it can be found in popular repositories (APT, YUM, etc.):

`sudo apt install tmux -y`

Oh-my-tmux (From  https://github.com/gpakosz/.tmux) - I Updated this in 2023 ; Commands may change in the future

```bash
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```


# General Terminal and utilities

### 1.- Using Zellij terminal multiplexor

Installing [Zellij](https://github.com/zellij-org/zellij)
alias z='zellij options --theme dracula' # set at .bashrc

### Memory:
Check for swap usage in df -h

### System Monitoring
Resource monitor: `htop`
General Hardware & System info, benchmarking, etc. (GUI): `hardinfo`
GPU: `intel_gpu_top`
SpeedTest: `speedtest` -> From Ookla, its repository is in /etc/apt/sources.list.d

### Hide desktop icons - MATE (Locks the desktop)
`gsettings set org.mate.background show-desktop-icons false`

### Webcam:
`cvlc v4l2:///dev/video0`

### DPKG - List programs installed + dates of installation 
(Format yyyy-mm-dd \t program):
`grep "installed" /var/log/dpkg.log | awk '{print $1 "\t" $5}' | cut -d ":" -f 1 | sort | uniq | less`

### Redshift (Night mode)
Command enable: /etc/init.d ~/.conf/redshift.conf

## Battery life and stats:
- tlp  (Program). Run tlp-stat -p/-r/-t/-w etc. Processor, alerts, Temp, battery life, etc. 

### Custom DNS nameservers:

Modifying nameserver. Default: ISP / Router's config.
https://www.techradar.com/news/best-dns-server

-- Open Nic: Automatically detect the most efficient route for location:
https://www.opennic.org/
--Alternative: Quad9 -> 9.9.9.9
