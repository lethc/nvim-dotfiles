return {
	"CRAG666/code_runner.nvim",
	config = true,
	cmd = { "RunCode", "RunFile", "RunProject", "CompilerOpen" },
	-- keys = { "<Leader>r" },
	opts = {
		filetype = {
			c = "cd $dir && clang $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt",
			java = "cd $dir && java -cp . $fileName",
			python = "python3 -u",
			typescript = "deno run",
			rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
			javascript = "cd $dir && node $fileName",
		},
		project = {
			["~/Workspace/JavaDev/my-app/"] = {
				name = "my-app",
				description = "test",
				file_name = "src/main/java/com/mycompany/app/App.java",
				command = "mvn clean package && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App",
				-- command = "java -cp target/LearningJava-1.0-SNAPSHOT.jar com.mycompany.app.App",
			},
		},
		startinsert = true,
	},
	keys = {
		{ "<leader>r", "<esc><cmd>RunCode<CR>", mode = { "n" }, desc = "RunCode" },
	},
}
