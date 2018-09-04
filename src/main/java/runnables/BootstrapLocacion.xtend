package runnables

import ar.edu.eventos.Locacion
import ar.edu.repositorios.RepositorioLocacion
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point

class BootstrapLocacion extends CollectionBasedBootstrap {
	
	Locacion salonFiesta
	Locacion hipodromo
	Locacion tecnopolis

	new() {

		ApplicationContext.instance.configureSingleton(typeof(Locacion), new RepositorioLocacion)
	}

	def inicioLocaciones() {
            salonFiesta = new Locacion() => [
			descripcion = "Salon de Fiesta"
			coordenadaX=-34.559276
			coordenadaY=-58.505377
			puntoGeografico = new Point(coordenadaX,coordenadaY)
			superficie = 10d
		]
		tecnopolis = new Locacion() => [
			descripcion = "Tecnopolis"
			coordenadaX=-34.559276
			coordenadaY=-58.505377
			puntoGeografico = new Point(coordenadaX,coordenadaY)
			superficie = 6d
		]
		hipodromo = new Locacion() => [
			descripcion = "hipodromo San Isidro"
			coordenadaX=-34.559276
			coordenadaY=-58.505377
			puntoGeografico = new Point(coordenadaX,coordenadaY)
			superficie = 4.8d
		]


	}

	override run() {

		val RepositorioLocacion repoLocacion = ApplicationContext.instance.getSingleton(typeof(Locacion)) as RepositorioLocacion
		this.inicioLocaciones
		repoLocacion => [
			create(salonFiesta)
			create(hipodromo)
			create(tecnopolis)
			
		]

	}
	
	
}