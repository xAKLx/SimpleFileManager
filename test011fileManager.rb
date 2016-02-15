class FileManagerBetaV1
	def FileManagerBetaV1.writeLine filename, str
		afile = File.new filename, "w"
		afile.syswrite str + "\n" 
		afile.close
	end

	def FileManagerBetaV1.getAllLines filename
		IO.readlines filename
	end

	def FileManagerBetaV1.createVoidFile filename
		File.new( filename, "w" ).close
	end

	def FileManagerBetaV1.deleteFile filename
		File.delete filename
	end

	def FileManagerBetaV1.renameFile filename, newname
		File.rename filename, newname
	end
end