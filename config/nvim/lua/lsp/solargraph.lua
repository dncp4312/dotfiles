require('lspconfig').solargraph.setup {
    cmd = { 'docker', 'exec', '-i', 'solargraph', 'solargraph', 'stdio' },
    -- cmd = { 'docker', 'exec', '-i', 'hta_solargraph', 'solargraph', 'stdio' },
    -- cmd = { 'docker exec -i hta_solargraph solargraph socket --host=0.0.0.0 --port 7658' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
	solargraph = {
	    autoformat = true,
	    diagnostics = true,
	    formatting = true,
	    completion = true,
	    -- transport = 'external',
	    -- externalServer = {
		-- host = 'localhost',
		-- port = 7658,
	    -- },
	}
    }
}
