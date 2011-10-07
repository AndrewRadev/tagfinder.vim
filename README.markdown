The purpose of this plugin is to enable searching for classes, functions or any
other language structures by their name. It expects a tag file generated by
using exuberant ctags.

Defining a global command to look for a class by its name would look like this:

    :DefineGlobalTagFinder Class c,class

After this command is invoked, you can execute the `Class` command with a tag
name, which will send you to the class if it's unique, or load the entries in
the quickfix window and let you choose between them.

    :Class ActiveRecord

Even more conveniently, the newly defined command will have tab-completion with
the tag names, so you don't have to type it all in and you can see a useful
overview of the matching classes (or functions, modules, vim commands...).

Since different file types have different tag definitions, you can override
commands per buffer by placing `DefineTagFinder` invocations in filetype
plugins, or by using autocommands:

    " in ftplugin/ruby.vim
    DefineTagFinder Method f,method

    " in .vimrc
    autocommand FileType java DefineTagFinder Method m,method

Note that the plugin comes with **no predefined commands**. My personal
preference is to call them "Class", "Function" and so on, but you might prefer
to use "FindClass" and "FindFunction" instead. The plugin simply provides the
defining command. For more information on installation and usage, please take a
look at the doc file.