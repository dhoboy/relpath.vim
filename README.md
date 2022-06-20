# Relpath.vim
Dead Simple Relative Path Importing helper for Neovim and Vim.\
Makes Vim's built in File completion mode `<C-x C-f>` more useful.\
Like `set autochdir` without breaking your fuzzy finder across the project.

```
Plug Install 'dhoboy/relpath.vim'
```

This plugin adds the following bindings:
```
<leader>rp " relative path - sets working directory to path of the file you're in
<leader>pp " project path  - sets working directory to the projet path where you opened vim
```

## What this Plugin does

Take a project file tree, like this:

```
- ~/myProject
|
-- actions
 |
 | -- coolAction.js
 | -- otherAction.js
 |
-- components
 |
 | -- LandingPage.js
 | -- Details.js
 |
```

## The Problem

You open (n)vim from the project root, so in your terminal at `~/myProject` you
type: `vim .` or `nvim .`

You're doing your thing, and you're fuzzy finding over the project. Life is good.

But then you're in a specific file, say `LandingPage.js` and you want to import
something from `coolAction.js` with auto-completion on the filepath as you type,
relative to `LandingPage.js`.

### For example:
Type `import { doCoolThing } from "../`. Now you want to see a popup window with
the result of calling `cd ..` from `~/myProject/components`,
so you can work your way across the project directory to find the desired actions
file to get your import set and move on with your work.

Something like `set autochdir` will break your fuzzy finder, b/c it'll only fuzzy
find over the folder of the file vim changed to when you opened `LandingPage.js`,
so just the `components` folder. Not what we want!

And, if you just run File completion mode inside Insert mode, `<C-x C-f>`,
it will find files from the project root, which is cool, but its not relative to
your current file, so not quite what we want.

## Using this plugin
This plugin auto-saves the directory you opened vim from into the `p` register.
Then, when you're in a file you want to auto-complete a filepath from, you
`<leader>rp` (relative path) and then type your `../<C-x C-f>` to get relative
path autocomplete suggestions.

When you're done, and want your fuzzy finder to work again, you type `<leader>pp`
(project path) and you're all set!

Just don't overwrite the `p` register!
The workflow this plugin assumes is that you open (n)vim from your project root,
hence the `pp` (project path) naming.

Developed with neovim v0.7 and Telescope.

