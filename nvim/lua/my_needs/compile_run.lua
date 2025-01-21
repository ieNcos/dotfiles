local split = function()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end
local get_conda_env = function()
  local conda_env = io.popen("conda env list | grep '*' | awk '{print $1}'"):read("*a")
  conda_env = string.gsub(conda_env, "\n", "") -- 移除末尾的换行符
  return conda_env
end

local compileRun = function()

	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype
	if ft == "dart" then
		vim.cmd(":FlutterRun -d " .. vim.g.flutter_default_device .. " " .. vim.g.flutter_run_args)
	elseif ft == "markdown" then
		vim.cmd(":InstantMarkdownPreview")
	elseif ft == 'cpp' then
		split()
		vim.cmd("term g++ % -o %< && ./%<")
        --[=[
		vim.cmd([[
			" exec "silent !g++ % -o %<"
    	exec "term g++ % -o %< && \%<"
			]])
            --]=]
	elseif ft == 'c' then
		split()
		vim.cmd("term gcc % -o %< && ./%<")
		--vim.cmd([[
			--" exec "silent !gcc % -o %<"
    	--exec "term gcc % -o %< && \%<"
		--]])
	elseif ft == 'python' then
        local TMP_FOR_VIM = get_conda_env()
		split()
--set TMP_FOR_VIM $(conda info --envs | grep '\*' | cut -d ' ' -f 1); 
		vim.cmd([[ term conda activate ]]..TMP_FOR_VIM..[[; /usr/bin/env python % ]])
	elseif ft == 'javascript' then
		split()
		vim.cmd("term node %")
	elseif ft == 'lua' then
		split()
		vim.cmd('exec "term lua %"')
	elseif ft == 'rust' then
		split()
		vim.cmd([[exec "term cargo run"]])
	elseif ft == 'clojure' then
		split()
		vim.cmd([[exec "term clojure -M %"]])
	end
end


vim.keymap.set('n', '<F5>', compileRun, { silent = true })

local tmp_run = function ()

    vim.cmd("w")
    local ft = vim.bo.filetype
    if ft == "rust" then
        split()
        vim.cmd([[exec "term cargo build --target thumbv7em-none-eabihf"]])
    end
end
vim.keymap.set('n', '<leader>bt', tmp_run, {silent = true})


local run = function()
--
--
	---- check file type
	local ft = vim.bo.filetype
	if ft == "dart" then
		vim.cmd(":FlutterRun -d " .. vim.g.flutter_default_device .. " " .. vim.g.flutter_run_args)
	----elseif ft == "markdown" then
		----vim.cmd(":InstantMarkdownPreview")
	elseif ft == 'c' then
		vim.cmd("term gcc % -o %< && ./%< && rm %<")
		split()
		vim.cmd([[
			exec "term gcc % mpc.c -o %< && \%<"
		]])
	----elseif ft == 'javascript' then
		----split()
		----vim.cmd("term node %")
	----elseif ft == 'lua' then
		----split()
		--vim.cmd("term luajit %")
	elseif ft == 'py' then
		split()
		vim.cmd([[exec "term python3 -i %"]])
	elseif ft == 'rust' then
		split()
		vim.cmd([[exec "term cargo run"]])
	elseif ft == 'clojure' then
		split()
		vim.cmd([[exec "term lein repl"]])
	end
end
--
vim.keymap.set('n', '<F9>', run, { silent = true })
--
