import os
import subprocess

os.chdir('/Users/luisgomez/.vim_runtime/my_plugins')

if os.path.exists('/Users/luisgomez/.vim_runtime/vimrcs/vimplugrc.vim'):
    os.remove('/Users/luisgomez/.vim_runtime/vimrcs/vimplugrc.vim')

non_plugin_dirs = { '.gitkeep', 'log_all_plugin_names.py',  'logfile.txt', 'package-lock.json' }


with open('/Users/luisgomez/.vim_runtime/vimrcs/vimplugrc.vim', 'a') as plugvimrc:
    plugvimrc.write("""call plug#begin ('~/.vim_runtime/vim_plug_plugins')\n\n""")
    for dir in os.listdir('./'):
        if dir not in non_plugin_dirs:
            os.chdir(dir)
            git_remotes = subprocess.check_output(['git', 'remote', '-v'])
            git_remotes = git_remotes.replace('origin\t', '')
            git_remote_pull = git_remotes.split(' ')[0]
            # ex plug line:
            # Plug 'https://github.com/junegunn/vim-github-dashboard.git'
            plugvimrc.write("""Plug '{}'\n""".format(git_remote_pull))
            os.chdir('..')

    plugvimrc.write("""\ncall plug#end()\n""")
