import os
import sys

global dest_path
dest_path = [] # Using a list here due to the problems caused by the recursive function

def terminal_print(msg):
    '''
    Writes out a message to the terminal
    '''

    sys.stdout.write(msg+"\n")

def get_final_subdir(path):
    '''
    Splits the path by the front slash as a delimiter, and 
    returns the last portion of the path given
    '''

    return path.split("/")[-1]

def find_folder(folder, path):
    '''
    A recursive function that visits all the (sub)directories
    of the Desktop, and looks for a given folder within
    '''

    if get_final_subdir(path) == str(folder):
        return True

    for dir in os.listdir(path):
        curr_path = os.path.join(path, dir) # Append currentds directory to path already given
        if os.path.isdir(curr_path) and find_folder(folder, curr_path) == True:
            dest_path.append(curr_path) 
            return True

    return False

path = "~/Desktop/" # Starting at desktop directory
dir_found = find_folder(''.join(sys.argv[1:]).lower(), os.path.expanduser(path)) # Omit first arg, as that is just the name of file

if dir_found is True:
    os.system("code "+ dest_path[0])
else:
    os.system("echo Not a valid directory!")