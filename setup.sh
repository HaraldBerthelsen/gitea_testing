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
cp /home/harald/git/gitea_testing/app-template.ini custom/conf/app.ini


exit

END

#Don't do these by script..
#setup service
#cp /home/harald/git/gitea_testing/gitea.service /etc/systemd/system/gitea.service
#start service
#systemctl enable gitea.service
#systemctl start gitea.service

#./gitea admin create-user --admin --name harald --email me@example.com --password
#./gitea admin create-user --name abair-web --email me2@example.com --password urlabhra
#./gitea admin create-user --name abair-software --email me3@example.com --password urlabhra

#create organisation abair-web, add users to it
#create html repository as abair-web
#Need to add every user to team, and also every repo to team. Makes sense. Can this be done by api?
#yes:
#PUT /teams/{id}/members/{username} Add a team member
#PUT /teams/{id}/repos/{org}/{repo} Add a repository to a team

#http PUT http://localhost:3000/api/v1/teams/contributors/members/test_contributor2
#No, fails, says team does not exist..
#Oh it needs team id number
#But this fails as well:
#http --auth harald PUT http://localhost:3000/api/v1/teams/8/members/kalleanka
#http: password for harald@localhost:3000: 
#HTTP/1.1 404 Not Found

#So is the swagger doc wrong?

#webui add repo to team:
#/org/<ORG>/teams/<TEAM>/repositories


#import svn new_html into html repository:
#
#mkdir -p my_repos/abair-web/html
#cd my_repos/abair-web/html


#Copy what you want (in this case skip the big folder audiobooks_edit)
#cp -r ~/svn/Web/new_html/!(audiobooks_edit) .
#Or copy everything..
#cp -r ~/svn/Web/new_html/* .
#rm -r .svn (if needed)

#Once the files you have are right: (do this by script)
#git init .
#git config credential.username abair-web
#git remote add gitea http://localhost:3000/abair-web/html.git
#git add *
#git commit . -m "initial commit" 

#FIRST TIME PUSH ONLY:
#git push --set-upstream gitea master
#AFTER THAT
#git push
