package ar.edu.tp.runnable

import ar.edu.eventos.EventoAbierto
import ar.edu.eventos.EventoCerrado
import ar.edu.eventos.Locacion
import ar.edu.repositorios.RepositorioUsuarios
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
	}
	
	override run() {
		val RepositorioUsuarios repoUsuario = ApplicationContext.instance.getSingleton(
			typeof(Usuario)) as RepositorioUsuarios
		
		val salonFiesta = new Locacion() => [
			descripcion = "Salon de Fiesta"
			puntoGeografico = new Point(-34.603695, -58.410973)
			superficie = 10d
		]
		val tecnopolis = new Locacion() => [
			descripcion = "Tecnopolis"
			puntoGeografico = new Point(-34.559276, -58.505377)
			superficie = 6d
		]
		val hipodromo = new Locacion() => [
			descripcion = "hipodromo San Isidro"
			puntoGeografico = new Point(-34.480860, -58.518295)
			superficie = 4.8d
		]
		
		val hipodromoPalermo = new Locacion() =>[
			descripcion = "hipodromo Palermo"
			puntoGeografico = new Point(-34.567684, -58.429661)
			superficie = 4.8d
		]
			 
		val lollapalooza = new EventoAbierto() => [
			nombreEvento = "lollapalooza"
			inicioEvento = LocalDateTime.of(2018, 03, 27, 18, 00)
			finEvento = LocalDateTime.of(2018, 03, 28, 01, 00)
			lugar = hipodromo
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 03, 15, 23, 59)
			edadMinima = 18
			valorEntrada = 500
		]
		
		val minifiesta1 = new EventoCerrado() => [
			nombreEvento = "minifiesta1"
			inicioEvento = LocalDateTime.of(2018, 05, 31, 14, 00)
			finEvento = LocalDateTime.of(2018, 05, 31, 15, 00)
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 05, 31, 11, 30)
			lugar = salonFiesta
			capacidadMaxima = 20
		]
		val minifiesta2 = new EventoCerrado() => [
			nombreEvento = "minifiesta2"
			inicioEvento = LocalDateTime.of(2018, 06, 15, 14, 00)
			finEvento = LocalDateTime.of(2018, 06, 15, 15, 00)
			fechaMaximaConfirmacion = LocalDateTime.of(2018, 06, 15, 11, 30)
			lugar = salonFiesta
			capacidadMaxima = 20
		]
		val maxi = new Usuario() => [
			nombreUsuario = "maxi5"
			nombreApellido = "Maxi Coronel"
			mail = "maxigg@gmail.com"
			setDireccion("Carlos Francisco Melo", 2356, "Vicente Lopez", "Buenos Aires",
				new Point(-34.534199, -58.490467))
			fechaHoraActual = LocalDateTime.of(2018, 02, 15, 15, 30)
			fechaNacimiento = LocalDate.of(1977, 08, 09)
			miTarjeta = new CreditCard
			servicioTarjeta = mockearCreditCardServicePagoExitoso(miTarjeta, lollapalooza.valorEntrada)
			comprarEntrada(lollapalooza)
			radioCercania = 30
		]
		val juan = new Usuario() => [
			nombreUsuario = "juan"
			nombreApellido = "Juan Martin del Potro"
			mail = "juan00@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			miTarjeta = new CreditCard
			servicioTarjeta = mockearCreditCardServicePagoExitoso(miTarjeta, lollapalooza.valorEntrada)
			comprarEntrada(lollapalooza)
		]
		
		val agustina = new Usuario() => [
			nombreUsuario = "agustina"
			nombreApellido = "agustina pastor"
			mail = "agus2000@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			radioCercania = 30
			tipoUsuario = new Profesional
			crearEvento(minifiesta2)
			crearEvento(lollapalooza)
			
		]
		
		val agustin = new Usuario() => [
			nombreUsuario = "agustin"
			nombreApellido = "agustin gonzalez"
			mail = "agustinKpo@gmail.com"
			setDireccion("Quintana", 2551, "San Martin", "Buenos Aires", new Point(-34.578651, -58.549614))
			fechaHoraActual = LocalDateTime.of(2018, 03, 15, 22, 00)
			fechaNacimiento = LocalDate.of(2000, 01, 02)
			tipoUsuario = new Amateur
			crearEvento(minifiesta1)
			invitarUsuario(agustina, minifiesta1, 6)
			invitarUsuario(juan, minifiesta1, 5)
			invitarUsuario(maxi, minifiesta1, 1)
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

	}
	def CreditCardService mockearCreditCardServicePagoExitoso(CreditCard tarjeta, double valor) {
		val servicioTarjeta = mock(typeof(CreditCardService))
		when(servicioTarjeta.pay(tarjeta, valor)).thenReturn(new CCResponse()=>[statusCode = 0 statusMessage = "Transaccion Exitosa"])
		return servicioTarjeta
	}
}
