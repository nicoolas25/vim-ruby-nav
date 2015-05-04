function! GetFullModule()
py << EOF
import re
import vim
module_pattern = re.compile("([A-Za-z:]+)")
col = vim.current.window.cursor[1]
for match in module_pattern.finditer(vim.current.line):
  if match.start() <= col and match.end() >= col:
    vim.command('return "%s"' % match.group(0))
    break
EOF
endfunction

function! GetModule()
py << EOF
import vim
full_module_name = vim.eval("GetFullModule()")
vim.command('return "%s"' % full_module_name.split(":")[-1])
EOF
endfunction

function! ToSnakeCase(name)
py << EOF
import re
import vim
name = vim.eval("a:name")
snake_name = "_".join([part.lower() for part in re.findall("[A-Z][a-z]+", name)])
if snake_name == "":
  snake_name = name
vim.command('return "%s"' % snake_name)
EOF
endfunction

function! Gf()
  let file_name = ToSnakeCase(GetModule())
  let extension = expand("%:e")
  let file_name = file_name . "." . extension
  exec "set path^=app/**"
  exec "find " . file_name
  exec "set path-=app/**"
endfunction

map <leader>f :call Gf()<cr>
