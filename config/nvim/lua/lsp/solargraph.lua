require('lspconfig').solargraph.setup {
    cmd = { 'docker', 'exec', '-i', 'solargraph', 'solargraph', 'stdio' },
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
