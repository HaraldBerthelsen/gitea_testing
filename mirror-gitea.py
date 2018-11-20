import requests
import json
import sys, os

#Mirror the repositories at https://www.abair.tcd.ie/gitea
#1 List "organisations"
#2 For each organisation, list repositories
#3 for each repository, clone if it's not here, or pull if it is
user = "harald"
pw = "bajen!"


base_url = "www.abair.tcd.ie/gitea"
api_url = "https://%s/api/v1" % base_url
clone_url = "https://%s:%s@%s" % (user,pw,base_url)

def call(url):    
    response = requests.get(url, auth=(user,pw))

    if response.status_code != 200:
        print(response.status_code)
        print(response.text)
        sys.exit(1)

    return response.json()

def cloneOrPull(directory):    
    if os.path.isdir(directory):
        pull(directory)
    else:
        print("Making directory %s" % os.path.dirname(directory))
        try:
            os.makedirs(os.path.dirname(directory))
        except FileExistsError:
            print("Directory %s exists, not created" % os.path.dirname(directory))
        clone(directory)

def pull(directory):
    cwd = os.getcwd()
    os.chdir(directory)
    cmd = "git pull"
    print(cmd)
    os.system(cmd)
    os.chdir(cwd)

def clone(directory):
    cwd = os.getcwd()
    os.chdir(os.path.dirname(directory))
    cmd = "git clone '%s/%s.git'" % (clone_url, directory)
    print(cmd)
    os.system(cmd)
    os.chdir(cwd)
    


url = "%s/user/orgs" % api_url
organisations = call(url)
for organisation in organisations:
    print(organisation["username"])
    url = "%s/orgs/%s/repos" % (api_url, organisation["username"])
    repositories = call(url)
    for repository in repositories:
        print(repository["full_name"])
        cloneOrPull(repository["full_name"])
