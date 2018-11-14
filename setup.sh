adduser --system --shell /bin/bash --group --disabled-password --home /home/git git

su git <<END

cd /home/git
mkdir gitea
cd gitea

#wget -O gitea https://dl.gitea.io/gitea/1.6/gitea-1.6-linux-amd64
cp /home/harald/gitea .

chmod +x gitea


#copy config file
mkdir -p custom/conf
cp /home/harald/custom/conf/app-template.ini custom/conf/app.ini

exit

END

#setup service
#start service



