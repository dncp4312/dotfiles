require('lspconfig').solargraph.setup {
    cmd = { 'docker', 'exec', '-i', 'solargraph', 'solargraph', 'stdio' },
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
