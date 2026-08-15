python3 << en
import json, base64, os, uuid

# requests is optional — don't error at source time if it's missing
try:
    import requests
except Exception:
    requests = None

import vim

def submitRpc():
    if requests is None:
        print('dbtrpc: python "requests" module not available; install it to use dbt RPC helper')
        return
    try:
        url = "http://0.0.0.0:8580/jsonrpc"
        headers = {'content-type': 'application/json'}
        cb = '\n'.join(vim.current.buffer)
        sql = cb.encode('utf-8')
        encoded_sql = base64.b64encode(sql).decode('utf-8')
        filepath = vim.current.buffer.name or ''
        filename = os.path.splitext(os.path.basename(filepath))[0] if filepath else 'buffer'
        payload = {
            "jsonrpc": "2.0",
            "method": "compile",
            "id": uuid.uuid1().int,
            "params": {
                "timeout": 60,
                "sql": encoded_sql,
                "name": filename
            }
        }
        resp = requests.post(url, data=json.dumps(payload), headers=headers)
        response = resp.json()
        compiled_sql = response.get('result', {}).get('compiled_sql', '')
        print(compiled_sql)
    except Exception as e:
        print('dbtrpc submitRpc error: %s' % str(e))
en

function! Redir(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let output = system(matchstr(a:cmd, '^!\zs.*'))
	else
		redir => output
		execute a:cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap number
	call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<q-args>)

" Buffer-local mapping so it doesn't pollute other filetypes
nnoremap <silent> <buffer> <leader>rpcc :Redir python3 submitRpc()<CR>
