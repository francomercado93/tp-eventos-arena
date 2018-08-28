package runnables

import ar.edu.repositorios.RepositorioServicios
import ar.edu.servicios.Servicio
import ar.edu.servicios.TarifaFija
import ar.edu.servicios.TarifaPersona
import ar.edu.servicios.TarifaPorHora
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point

class BootrapServicios extends CollectionBasedBootstrap {

	Servicio animacionMago
	Servicio cateringFoodParty
	Servicio candyBarWillyWonka

	new() {

		ApplicationContext.instance.configureSingleton(typeof(Servicio), new RepositorioServicios)
	}

	def inicioServicios() {

		animacionMago = new Servicio() => [
			tipoTarifa = new TarifaPorHora(300, 12)
			descripcion = "Animacion Mago"
			tarifaPorKilometro = 7
			ubicacionServicio = new Point(-34.515938, -58.485094)
		]
		cateringFoodParty = new Servicio() => [
			descripcion = "Catering Food Party"
			tipoTarifa = new TarifaPersona(15, 0.8)
			tarifaPorKilometro = 5
			ubicacionServicio = new Point(-34.513628, -58.523435)
		]
		candyBarWillyWonka = new Servicio() => [
			descripcion = "candy Bar Willy Wonka"
			tipoTarifa = new TarifaFija(750)
			tarifaPorKilometro = 20
			ubicacionServicio = new Point(-34.569370, -58.484621)
		]

	}

	override run() {

		val RepositorioServicios repoServicio = ApplicationContext.instance.getSingleton(typeof(Servicio)) as RepositorioServicios
		this.inicioServicios
		repoServicio => [
			create(animacionMago)
			create(cateringFoodParty)
			create(candyBarWillyWonka)
			
		]

	}
}
