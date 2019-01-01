## Bash Tutorial

### Background
* Shell: A user interface for access to an operating system's services
* CLI: command-line interface
* GUI: Graphical User Interface
* Bash: Bourne Again Shell, one of the most popular Unix shells

### Links
* Inode (index node): Each file has an inode including the information of that file
* Soft links: Just like shortcut, only pointing to the original file, has a different inode with the original file
* Hard links: Just like a copy, still exists even delete the original file, has the same inode with the original file
* 'ls -i' shows the inode of the files in current directory
* 'ln file_name link_name' creates a hard link for file_name with link_name, 'ln -s file_name link_name' creates a soft link

### Directories
* ~: always represents your home directory
* /: always represenyts your root directory
* -: represents the previous directory, usually be used in cd -
* pwd: shows your current directory
* pushd & popd let you go to some directory and easily get back
* 'ls' command collection:
  * '-t': sort by date
  * '-r': reverse the default order
  * '-R': recursively list all the files, which gives all the child files in that directory
  * '-i': show the inode of each file
  * '-l': show in long listing
  * '-a': show all files including the hidden ones
  

### Files
* 'file' + file name gives you the type of that file
* 'history' gives you the recent unique commands
* 'which' gives you the path of a file
* 'whatis' gives you a short description of that file
* 'apropos' gives you the help for specific objects
* 'man' gives you the detail of a command
* 'mkdir' creates a new directory
* 'touch' updates the date of a file, if no such file, then creates it
* 'cp file_path new_name' copies the file from the directory and then copy to your current directory with the new name
* 'mv target_file target_path' moves your target_file to the target_path
* 'rm' removes the target file; 'rmdir' removes the directory
