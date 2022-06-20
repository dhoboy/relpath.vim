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
```

## the problem

You open (n)vim from the project root, so in your terminal at `~/myProject` you type: `vim .` or `nvim .`

You're doing your thing, and you're fuzzy finding over the project. Life is good.

But then you're in a specific file, say `LandingPage.js` and you want to import something from `coolAction.js` with auto-completion on the filepath as you type, relative to `LandingPage.js`.

### For example:
Type `import { doCoolThing } from "../`
And here, you want to see a popup window with the result of calling `cd ..` from `~/myProject/components` so you can work your way across the project directory to find the desired actions file to get your import set and move on with your work.

Something like `set autochdir` will break your fuzzy finder, b/c it'll only fuzzy find over the folder of the file vim changed to when you opened `LandingPage.js`, so just the `components` folder. Not what we want!

And, if you just run File completion mode inside Insert mode, `<C-x C-f>`, it will find files from the project root, which is cool, but its not relative to your current file, so not quite what we want.

## the solution
So, the cleanest way I've found to do this w/o installing and setting up any completion plugins that may also offer things you don't need is this:

### (add this to your .vimrc)
```
" relative path (change directory to current file)
nnoremap <leader>rp :lcd %:h<cr> " source-- https://dmerej.info/blog/post/vim-cwd-and-neovim/


" project path (the directory where you opened vim)
" -- save the project path when vim opens
autocmd TermResponse * :let @p=@%
" -- keybinding to re-set project path as path for current file (so your fuzzy finder works)
nnoremap <leader>pp :exe "lcd " . @p<cr>
```

What we have here, is vim auto saves the directory you opened it from into the `p` register after vim opens.
Then, when you're in a file you want to auto-complete a filepath from, you `<leader>rp` (relative path)
and then type your `../<C-x C-f>` to get relative path autocomplete suggestions.

When you're done, and want your fuzzy finder to work again, you type `<leader>pp` (project path) and you're all set!

You can of course change the keybindings, and set another register to save the project path in. Just don't overwrite that register! This workflow assumes you open (n)vim from your project root, hence the `pp` (project path) naming.

Tested with my neovim v0.7 setup using Telescope.
