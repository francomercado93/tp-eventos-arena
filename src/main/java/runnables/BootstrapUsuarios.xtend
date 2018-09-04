package runnables

import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.usuarios.Amateur
import ar.edu.usuarios.Free
import ar.edu.usuarios.Profesional
import ar.edu.usuarios.Usuario
import gestionUsuarios.RepoTipoUsuario
import java.time.LocalDate
import java.util.Date
import java.util.List
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point

class BootstrapUsuarios extends CollectionBasedBootstrap {
	Usuario agustin
	Usuario agustina
	Usuario martin
	Usuario juan
	List<String> tipoUsuarios = newArrayList
	Profesional profesional = new Profesional
	Free free = new Free
	Amateur amateur = new Amateur

	new() {

		ApplicationContext.instance.configureSingleton(typeof(Usuario), new RepositorioUsuarios)
		ApplicationContext.instance.configureSingleton(typeof(String), new RepoTipoUsuario)
	}

	def inicioUsuarios() {
		agustin = new Usuario() => [
			nombreUsuario = "agustin"
			nombreApellido = "agustin gonzalez"
			mail = "agustinKpo@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			nacimiento = new Date(91, 3, 15)
		
			tipoUsuario = new Free()
		]
		agustina = new Usuario() => [
			nombreUsuario = "agustina"
			nombreApellido = "agustina pastor"
			mail = "agus2000@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			nacimiento = new Date(99, 2, 17)
			tipoUsuario = new Profesional()
		]
		juan = new Usuario() => [
			nombreUsuario = "juan"
			nombreApellido = "Juan Martin del Potro"
			mail = "juan00@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			nacimiento = new Date(98, 4, 24)
			tipoUsuario = new Amateur ()
		]
		martin = new Usuario() => [
			nombreUsuario = "martin"
			nombreApellido = "Martin Benitez"
			mail = "martinBntz@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			nacimiento = new Date(97, 7, 4)
			tipoUsuario = new Free()
		]
		tipoUsuarios.add(free.mostrarDescripcion)
		tipoUsuarios.add(amateur.mostrarDescripcion)
		tipoUsuarios.add(profesional.mostrarDescripcion)

	}

	override run() {

		val RepositorioUsuarios repoUsuario = ApplicationContext.instance.getSingleton(
			typeof(Usuario)) as RepositorioUsuarios
			
	   val RepoTipoUsuario repoTipo = ApplicationContext.instance.getSingleton(
			typeof(String)) as RepoTipoUsuario			
		this.inicioUsuarios
		repoUsuario => [
			create(martin)
			create(juan)
			create(agustin)
			create(agustina)
		]
			repoTipo => [
		lista.add(free.mostrarDescripcion)
		lista.add(amateur.mostrarDescripcion)
		lista.add(profesional.mostrarDescripcion)
		]

	}
}
