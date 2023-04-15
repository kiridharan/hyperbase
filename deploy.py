import os

# set the working directory

os.system('flutter build web')


# add all files to the repository
os.system('git add .')

# commit the changes with a commit message
commit_message = str(input('Enter a commit message: '))
os.system(f'git commit -m "{commit_message}"')

# push the changes to a remote repository
remote_name = 'origin'
branch_name = str(input('Enter a branch name: '))
os.system(f'git push {remote_name} {branch_name}')
