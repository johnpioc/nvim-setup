local M = {}

function M:setup()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = 
		vim.fn.stdpath("cache") .. "/jdtls/" .. project_name
	local config = {
		cmd = {

			"/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",

			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",

			"-jar",
			"/Users/johnpioc/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",

			"-configuration",
			"/home/hydroakri/.local/share/nvim/mason/packages/jdtls/config_mac",
			"-data",
			workspace_dir,
		},

		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

		settings = {
			java = {},
		},

		init_options = {
			bundles = {},
		},
	}
	require("jdtls").start_or_attach(config)
end

return M
