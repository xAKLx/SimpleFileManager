$LOAD_PATH << '.'
require "test011fileManager.rb"
#master
class FileManagerApp
	def main
		selected = -1

		until selected == 0
			system "cls"
			puts
			puts "0 - Cerrar aplicacion."
			puts "1 - Crear nuevo archivo."
			puts "2 - Crear o sobreescribir archivo con una linea."
			puts "3 - Mostrar contenido de un archivo."
			puts "4 - Renombrar un archivo."
			puts "5 - Borrar un archivo."
			puts "6 - Mostrar todos los archivos de este directorio."

			print "\nDigite la opcion deseada: "

			begin
			selected = Integer gets.chop

			rescue ArgumentError
			selected = -1
			end

			case selected
			when 0
				next
			when 1
				print "\nDigite el nombre del archivo a crear: "
				filename = gets.chop
				FileManagerBetaV1.createVoidFile filename
				puts "Su archivo fue creado con exito."
			when 2
				print "\nDigite el nombre del archivo: "
				filename = gets.chop
				print "\nDigite la linea que desea insertar en el archivo: "
				str = gets.chop
				FileManagerBetaV1.writeLine filename str
				puts "Su archivo fue creado y su linea fue agregada a el."
			when 3
				print "\nDigite el nombre del archivo a mostrar: "
				filename = gets.chop
				puts "Contenido del archivo "+filename
				puts 
				FileManagerBetaV1.getAllLines(filename).each {|str| puts str}
				puts
			when 4
				print "\nDigite el nombre del archivo al cual desea cambiar de nombre: "
				filename = gets.chop
				print "\nDigite el nuevo nombre deseado: "
				newname = gets.chop
				FileManagerBetaV1.renameFile filename, newname
				puts "El nombre de su arschivo " + filename + " ha sido modificado ha: " + newname
			when 5
				print "\nDigite el nombre del archivo a borrar: "
				filename = gets.chop
				FileManagerBetaV1.deleteFile filename
				puts "El archivo "+ filename+" ha sido borrado con exito." 
			when 6
				puts $LOAD_PATH
				puts
				Dir.entries(".").each {|str| puts str}
			else
				puts "\nValor invalido."			
			end
			print "Precione enter para continuar...."
			gets
			
		end

	end
end



begin
	app = FileManagerApp.new
	app.main
end