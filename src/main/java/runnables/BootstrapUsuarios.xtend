package runnables

import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.usuarios.Free
import ar.edu.usuarios.Usuario
import java.time.LocalDate
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point

class BootstrapUsuarios extends CollectionBasedBootstrap {
	Usuario agustin
	Usuario agustina
	Usuario martin
	Usuario juan

	new() {

		ApplicationContext.instance.configureSingleton(typeof(Usuario), new RepositorioUsuarios)
	}

	def inicioUsuarios() {
		agustin = new Usuario() => [
			nombreUsuario = "agustin"
			nombreApellido = "agustin gonzalez"
			mail = "agustinKpo@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaNacimiento = LocalDate.of(2000, 01, 02)
            tipoUsuario = new Free()
		]
		agustina = new Usuario() => [
			nombreUsuario = "agustina"
			nombreApellido = "agustina pastor"
			mail = "agus2000@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			tipoUsuario = new Free()
		]
		juan = new Usuario() => [
			nombreUsuario = "juan"
			nombreApellido = "Juan Martin del Potro"
			mail = "juan00@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			tipoUsuario = new Free()
		]
		martin = new Usuario() => [
			nombreUsuario = "martin"
			nombreApellido = "Martin Benitez"
			mail = "martinBntz@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			tipoUsuario = new Free()
		]
	}

	override run() {

		val RepositorioUsuarios repoUsuario = ApplicationContext.instance.getSingleton(
			typeof(Usuario)) as RepositorioUsuarios
		this.inicioUsuarios
		repoUsuario => [
			create(martin)
			create(juan)
			create(agustin)
			create(agustina)
		]

	}
}
