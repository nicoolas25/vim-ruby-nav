# Vim plugin experimentation

This is a vim plugin aimed to make the file navigation into a custom ruby project easier.

It fits my own workflow but it could also fits yours!

It will allow doing what `gf` does on modules and classes searching in your `app` path.
The plugin is mostly in Python and should be easy to customize.

## Configuration

Add the following lines to your `.vimrc`:

``` viml
if filereadable($PWD . "/.vimrc")
  autocmd VimEnter * exec "so " . $PWD . "/.vimrc"
endif
```

It will load the .vimrc file contained in the directory you are when vim is launched.

## Usage

1. Puts the .vimrc contained in this repository into you project folder
2. Use `<leader>f` as you would use `gf`

## Example

1. Using this repository as CWD
2. Edit the `app.rb` file
3. Make sure your cursor is on `Hello::Toto` class.
4. Type `<leader>f`
5. You should see the `app/toto.rb` file now...
