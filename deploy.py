import os

# set the working directory


def flutterbuild():
    os.system('flutter build web')


def init():

    # take current directory as path
    path = os.getcwd()

    try:
        # initialize a new git repository
        os.system('git init')

        # add all files to the repository
        os.system('git add .')

        # commit the changes with a commit message
        commit_message = str(input('Enter a commit message: '))
        os.system(f'git commit -m "{commit_message}"')

        # add a remote repository
        remote_name = 'origin'
        remote_url = str(input('Enter a remote url: '))
        os.system(f'git remote add {remote_name} {remote_url}')

        # push the changes to a remote repository
        branch_name = str(input('Enter a branch name: '))
        os.system(f'git push {remote_name} {branch_name}')
    except:
        print('Error')


def push():
    try:

        # add all files to the repository
        os.system('git add .')

        # commit the changes with a commit message
        commit_message = str(input('Enter a commit message: '))
        os.system(f'git commit -m "{commit_message}"')

        # push the changes to a remote repository
        remote_name = 'origin'
        branch_name = str(input('Enter a branch name: '))
        os.system(f'git push {remote_name} {branch_name}')
    except:
        print('Error')


def control():
    print('Welcome to the deploy script')

    print('What do you want to do?')
    print('1. Initialize a new repository')
    print('2. Push to an existing repository')
    print('3. Exit')
    choice = int(input('Enter your choice: '))
    print("Want to add flutter build web? Type y")
    flutter = input()

    if choice == 1 and flutter == 'y':
        init()
    elif choice == 2 and flutter == 'y':
        push()
    elif choice == 3:
        exit()
    else:
        print('Invalid choice')
        control()


if __name__ == '__main__':
    control()
