## Fast file setups.

1. In your terminal, run the following command:

```sh
cd ~ && https://github.com/Phoboes/mks.git && printf "\nsource 'mks/mks.sh'"
```

This command navigates to your root directory, clones this repo and adds the repo as a source to your bash_profile.

2. Restart your terminal window.

3. Enjoy.

Useage:

`mks <folder_name> <js_libraries>`

`mks` alone will create a folder with js/css and a linked html file in your current directory UNLESS a folder with that name already exists, in which case it aborts.

`mks folder_name` will create a folder with whatever word you put in place of folder_name, navigate to that folder and open your text editor.

`mks folder_name jq us bb` will do the same as above, but download and link the libraries you tell it to (in this case, jQuery, Underscore and Backbone). 

It is very flexible with library names, ie jQuery (or any case variation thereof) and the shorthand of jq work interchangeably, it also accepts an unlimited number of parameters.
