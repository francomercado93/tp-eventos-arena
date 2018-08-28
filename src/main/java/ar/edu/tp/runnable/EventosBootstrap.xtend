//package ar.edu.tp.runnable
//
//import ar.edu.repositorios.RepositorioUsuarios
//import ar.edu.usuarios.Usuario
//import java.time.LocalDate
//import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
//import org.uqbar.commons.applicationContext.ApplicationContext
//
//class EventosBootstrap extends CollectionBasedBootstrap{
//	
//	override run() {
//	
//		val juanito = new Usuario=>[
//			nombreUsuario = "juanito2"
//			nombreApellido = "juanitoPerez"
//			mail ="juanitoPerez@gmail.com"
//			fechaNacimiento = LocalDate.of(02,9, 1971)
//			//direccion = new Direccion("calle falsa", 123, "PPPP", "AAAA",  new Point(5,6))
//		]
//		(ApplicationContext.instance.getSingleton(typeof(Usuario)) as RepositorioUsuarios) => [
//		create(juanito)
//		]	
//	}
//	
//	
//	
//}