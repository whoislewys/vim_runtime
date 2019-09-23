import os
import subprocess

if os.path.exists('./logfile.txt'):
    os.remove('./logfile.txt')

non_plugin_dirs = { '.gitkeep', 'log_all_plugin_names.py',  'logfile.txt', 'package-lock.json' }
for dir in os.listdir('./'):
    with open('logfile.txt', 'a') as logfile:
        if dir not in non_plugin_dirs:
            os.chdir(dir)
            git_remotes = subprocess.check_output(['git', 'remote', '-v'])
            git_remotes = git_remotes.replace('origin\t', '')
            git_remote_pull = git_remotes.split(' ')[0]
            logfile.write('{}\n{}\n\n'.format(dir, git_remote_pull,))
            os.chdir('..')




