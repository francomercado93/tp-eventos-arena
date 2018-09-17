package ar.edu.tp.runnable

import ar.edu.eventos.EventoAbierto
import ar.edu.eventos.EventoCerrado
import ar.edu.eventos.Locacion
import ar.edu.repositorios.RepositorioLocacion
import ar.edu.repositorios.RepositorioServicios
import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.servicios.Servicio
import ar.edu.servicios.TarifaFija
import ar.edu.servicios.TarifaPersona
import ar.edu.servicios.TarifaPorHora
import ar.edu.usuarios.Amateur
import ar.edu.usuarios.Profesional
import ar.edu.usuarios.Usuario
import java.time.LocalDate
import java.time.LocalDateTime
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.ccService.CCResponse
import org.uqbar.ccService.CreditCard
import org.uqbar.ccService.CreditCardService
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.geodds.Point

import static org.mockito.Mockito.*

class EventosBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Usuario), new RepositorioUsuarios)
		ApplicationContext.instance.configureSingleton(typeof(Servicio), new RepositorioServicios)
		ApplicationContext.instance.configureSingleton(typeof(Locacion), new RepositorioLocacion)
	}

	override run() {
		val RepositorioUsuarios repoUsuario = ApplicationContext.instance.getSingleton(
			typeof(Usuario)) as RepositorioUsuarios

		val RepositorioServicios repoServicios = ApplicationContext.instance.getSingleton(
			typeof(Servicio)) as RepositorioServicios

		val RepositorioLocacion repoLocaciones = ApplicationContext.instance.getSingleton(
			typeof(Locacion)) as RepositorioLocacion

		val animacionMago = new Servicio() => [
			tipoTarifa = new TarifaPorHora(300, 12)
			descripcion = "Animacion Mago"
			tarifaPorKilometro = 7
			coordX=-2.46
			coordY=-58.645
			setUbicacionServicio
		]
		val cateringFoodParty = new Servicio() => [
			descripcion = "Catering Food Party"
			tipoTarifa = new TarifaPersona(15, 0.8)
			tarifaPorKilometro = 5
			coordX=-2.46
			coordY=-58.645
			setUbicacionServicio
		]
		val candyBarWillyWonka = new Servicio() => [
			descripcion = "candy Bar Willy Wonka"
			tipoTarifa = new TarifaFija(750)
			tarifaPorKilometro = 20
			coordX=-2.46
			coordY=-58.645
			setUbicacionServicio
		]
		val salonFiesta = new Locacion() => [
			descripcion = "Salon de Fiesta"
			coordenadaX=-42.2
			coordenadaY=-564.45
			setUbicacion
			superficie = 10d
		]
		val tecnopolis = new Locacion() => [
			descripcion = "Tecnopolis"
			coordenadaX=-42.2
			coordenadaY=-564.45
			setUbicacion
		]
		val hipodromo = new Locacion() => [
			descripcion = "hipodromo San Isidro"
			coordenadaX=-42.2
			coordenadaY=-564.45
			setUbicacion
			superficie = 4.8d
		]

		val hipodromoPalermo = new Locacion() => [
			descripcion = "hipodromo Palermo"
			coordenadaX=-42.2
			coordenadaY=-564.45
			setUbicacion
			superficie = 4.8d
		]

		val lollapalooza = new EventoAbierto() => [
			nombreEvento = "lollapalooza"
			inicioEvento = LocalDateTime.of(2018, 03, 27, 18, 00)
			finEvento = LocalDateTime.of(2018, 03, 28, 01, 00)
			locacion = hipodromo
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 03, 15, 23, 59)
			edadMinima = 18
			valorEntrada = 500
			contratarServicio(animacionMago)

		]

		val minifiesta1 = new EventoCerrado() => [
			nombreEvento = "minifiesta1"
			inicioEvento = LocalDateTime.of(2018, 05, 31, 14, 00)
			finEvento = LocalDateTime.of(2018, 05, 31, 15, 00)
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 05, 31, 11, 30)
			locacion = salonFiesta
			capacidadMaxima = 20
			contratarServicio(cateringFoodParty)
		]
		val minifiesta2 = new EventoCerrado() => [
			nombreEvento = "minifiesta2"
			inicioEvento = LocalDateTime.of(2018, 06, 15, 14, 00)
			finEvento = LocalDateTime.of(2018, 06, 15, 15, 00)
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 06, 15, 11, 30)
			locacion = salonFiesta
			capacidadMaxima = 20
			contratarServicio(candyBarWillyWonka)
		]
		val maxi = new Usuario() => [
			nombreUsuario = "maxi5"
			nombre = "Maxi"
			apellido = "Coronel"
			mail = "maxigg@gmail.com"
			setDireccion("Carlos Francisco Melo", 2356, "Vicente Lopez", "Buenos Aires",
				new Point(-1280.19, -58.4))
			fechaHoraActual = LocalDateTime.of(2018, 02, 15, 15, 30)
			fechaNacimiento = LocalDate.of(1977, 08, 09)
			tipoUsuario = new Profesional
			miTarjeta = new CreditCard
			servicioTarjeta = mockearCreditCardServicePagoExitoso(miTarjeta, lollapalooza.valorEntrada)
			comprarEntrada(lollapalooza)
			radioCercania = 30
			tipoUsuario = new Profesional
		]
		val juan = new Usuario() => [
			nombreUsuario = "juan"
			nombre = "Juan Martin"
			apellido = "Del Potro"
			mail = "juan00@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(34.5, -33.4))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			miTarjeta = new CreditCard
			servicioTarjeta = mockearCreditCardServicePagoExitoso(miTarjeta, lollapalooza.valorEntrada)
			comprarEntrada(lollapalooza)
			tipoUsuario = new Amateur
		]

		val agustina = new Usuario() => [
			nombreUsuario = "agustina"
			nombre = "Agustina"
			apellido = "Pastor"
			mail = "agus2000@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-87.56, 45.4))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			radioCercania = 30
			tipoUsuario = new Profesional
			crearEvento(minifiesta2)
			crearEvento(lollapalooza)
            tipoUsuario = new Amateur
		]

		val agustin = new Usuario() => [
			nombreUsuario = "agustin"
			nombre = "Agustin"
			apellido = "Gonzalez"
			mail = "agustinKpo@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-89.21, 44.45))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			tipoUsuario = new Amateur
			crearEvento(minifiesta1)
			invitarUsuario(agustina, minifiesta1, 6)
			invitarUsuario(juan, minifiesta1, 5)
			invitarUsuario(maxi, minifiesta1, 1)
			tipoUsuario = new Amateur
		]

		repoUsuario => [
			create(maxi)
			create(juan)
			create(agustin)
			create(agustina)
//			create(maxi)
//			create(gaby)
//			create(maria)
//			create(gaston)
		]
		repoServicios => [
			create(animacionMago)
			create(candyBarWillyWonka)
			create(cateringFoodParty)
		]
		repoLocaciones => [
			create(hipodromo)
			create(hipodromoPalermo)
			create(salonFiesta)
			create(tecnopolis)
		]

	}

	def CreditCardService mockearCreditCardServicePagoExitoso(CreditCard tarjeta, double valor) {
		val servicioTarjeta = mock(typeof(CreditCardService))
		when(servicioTarjeta.pay(tarjeta, valor)).thenReturn(new CCResponse() => [
			statusCode = 0
			statusMessage = "Transaccion Exitosa"
		])
		return servicioTarjeta
	}
}
