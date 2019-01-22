# Basic git/gitea tutorial for the Abair project

There are plenty of git usage tutorials for anything not covered here. This is only for basic workflow usage. Anything else, for example **branching** and **pull requests**, will be added later if at all..

This tutorial deals with the command line interface to git/gitea. There are plenty of GUIs that you can use if you prefer, especially if you're on mac or windows.

# Log in to the gitea web interface

Open https://www.abair.tcd.ie/gitea in your browser.

Click **sign-in** and sign in with your username and password. If you don't have one ask Harald to set it up for you.

# Change your password

If it's your first time signing in, change your password! At the top right of the screen, there is a symbol ('avatar' - you can change that if you like). Click it, then **settings**, then **account**. Type your new password in the 'New Password' and 'Re-Type New Password', then click update password. Done.

# Explore the repositories

In the top bar, click **explore** and have a look. There are lists of all repositories, users, and "organizations". This is a bad name really, they're used to group repositories into categories. Currently these are "abair-corpora", "abair-software", and "abair-web". There is also "abair-git-tutorial", containing a test repository that you can use for this tutorial.

# Clone a repository

When you find something that you need clone it to your computer. Here I will assume that it's the tutorial repository, otherwise of course replace that with what you want.

Click explore -> organizations -> abair-git-tutorial -> tutorial (or open https://www.abair.tcd.ie/gitea/abair-git-tutorial/tutorial)

You will see a list of the repository contents, followed by the README.md file. Above the list, on the right hand side, you will see a text box with the url to the repository. On the right of that, there are "copy" and "download" icons. Click the "copy" icon, and the url will be copied to your clipboard.

Open a terminal. CD to someplace where you want to keep your git repositories, for example $HOME/git (create the "git" directory if you need to).

In $HOME/git, type this into your terminal:

'git clone ' and then paste the url from gitea:

```$HOME/git>git clone https://www.abair.tcd.ie/gitea/abair-git-tutorial/tutorial.git```

You will be asked for your abair gitea username and password. Then the repository will be downloaded to your computer.

# Add a file to the repository

```cd tutorial```

```echo "hello" > my_new_file.txt```

Or of course open the new file in your text editor of choice and add anything you like.

```git add my_new_file.txt```

# Edit a file in the repository

Open the file in your favourite editor and change it as you please.

# Commit the file to the repository

```git commit my_new_file.txt -m "your commit message"```

or

```git commit . -m "your commit message"```

The commit message can be anything you like. It should preferably describe the change you made.

# Push to the remote repository

```git push```

You may be asked for username and password.

# Look again at the gitea web page

Reload the page, and you will see the new file.

# Remove a file

```git rm my_new_file.txt```

```git commit . -m "your message"```

```git push```


# That's all

* git clone URL
* git add FILE
* git rm FILE
* git commit FILE|. -m MESSAGE
* git push

# What's next?

Explore the possibilities of "issues" and "wiki" on the gitea page.

Find a gui to work with, if you prefer that. There are many!

Learn about git branches..





