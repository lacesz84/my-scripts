rsync -avz -e 'ssh -p 2298' --delete --exclude=.config/google-chrome ~/scripts ~/.ssh ~/.bashrc ~/.bash_aliases ~/*.kdbx ~/.config ~/.gitconfig laci@nl.dreamscape.hu:~/backup/bp-desktop
