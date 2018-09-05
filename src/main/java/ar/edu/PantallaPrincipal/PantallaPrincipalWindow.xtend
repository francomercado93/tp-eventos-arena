package ar.edu.PantallaPrincipal

import ar.edu.applicationModel.Estadisticas
import ar.edu.eventos.Locacion
import ar.edu.locaciones.ui.GestionarLocacionWindow
import ar.edu.servicios.Servicio
import ar.edu.servicios.TipoTarifa
import ar.edu.servicios.ui.GestionServiciosWindow
import ar.edu.usuarios.Usuario
import ar.edu.usuarios.ui.GestionUsuariosWindow
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class PantallaPrincipalWindow extends SimpleWindow<Estadisticas> {

	new(WindowOwner parent) {
		super(parent, new Estadisticas)
		modelObject.getUsuarios()
		title = "Event OS"
	}

	override protected addActions(Panel actionsPanel) {

	}

	override protected createFormPanel(Panel mainPanel) {		
	}
	
	override createMainTemplate(Panel mainPanel){
			mainPanel.layout = new HorizontalLayout
			val panelIzquierdo = new Panel(mainPanel)
			val panelDerecho = new Panel(mainPanel)
			this.crearListadoEstadisticas(panelIzquierdo)
			this.crearListadoUsuariosMasActivos(panelDerecho)
			this.crearListadoLocacionesMasPopulares(panelIzquierdo)
			this.crearListadoServicios(panelDerecho)
	}
	
	def crearListadoServicios(Panel panel) {
		val panelServicios = new Panel(panel)
		new Label(panelServicios).text = "Servicios:"
		val tablaServicios = new Table<Servicio>(panelServicios, typeof(Servicio))=>[
			items <=> "ultimosServiciosDadosDeAlta"
			setNumberVisibleRows(5)
		]
		new Column<Servicio>(tablaServicios)=>[
			title = "Nombre"
			fixedSize = 130
			bindContentsToProperty("descripcion")
		]
		new Column<Servicio>(tablaServicios)=>[
			title = "Tarifa"
			fixedSize = 130
			bindContentsToProperty("tipoTarifa").transformer = [TipoTarifa tipoTarifa | "$ "+ tipoTarifa.costoFijo +" " + tipoTarifa.descripcion ]
		]

		new Button(panelServicios) => [
				caption = "Gestion de servicios"
				onClick[ |new GestionServiciosWindow(this).open]
			]
	}
	
	def crearListadoLocacionesMasPopulares(Panel panel) {
		val panelLocaciones = new Panel(panel)
		new Label(panelLocaciones).text = "Locaciones"
		val tablaLocacion = new Table<Locacion>(panelLocaciones, typeof(Locacion))=>[
			items <=> "locacionesMasPopulares"
			setNumberVisibleRows(5)
		]
		new Column<Locacion>(tablaLocacion)=>[
			title = "Nombre"
			bindContentsToProperty("descripcion")
			fixedSize = 130
		]
		new Column<Locacion>(tablaLocacion)=>[
			title= "Capacidad"
			bindContentsToProperty("capacidad")
			fixedSize = 130
		]	

		new Button(panelLocaciones) => [
				caption = "Gestion de locaciones"
				onClick[ |new GestionarLocacionWindow(this).open]
		]
	}
	
	def crearListadoUsuariosMasActivos(Panel panel) {
		val panelUsrs = new Panel(panel)
			new Label(panelUsrs).text = "Usuarios mas activos:"	
			val tablaUsrs = new Table<Usuario>(panelUsrs, typeof(Usuario))=>[
				items <=> "usuariosMasActivos"
				setNumberVisibleRows(5)
			]
		
			new Column<Usuario>(tablaUsrs) =>[
				title = "Username"
				fixedSize = 130
  				bindContentsToProperty("nombreUsuario")
			]
			new Column<Usuario>(tablaUsrs) =>[
				title = "Nombre y apellido"
				fixedSize = 130
  				bindContentsToProperty("nombreApellido")
			]
			
			new Button(panelUsrs) => [
				caption = "Gestion de usuarios"
				onClick[ |new GestionUsuariosWindow(this).open]

			]
	}
	

	
	def crearListadoEstadisticas(Panel panel){
		new Panel(panel) => [
			layout = new ColumnLayout(2)
			
				new Label(it).text = "Estadisticas"
				new Label(it).text = ""
				new Label(it).text = "Cantidad total de eventos:"
				new Label(it)=>[
					
					value <=> "cantidadTotalEventosOrganizados"
				]
				new Label(it).text = "Eventos Ultimo mes:"
				new Label(it)=>[
					//background = Color.ORANGE
					value <=> "cantidadEventosUltimoMes"
				]
				new Label(it).text = "Eventos exitosos:"
				new Label(it)=>[
					value <=> "cantidadEventosExitosos"
				]
				new Label(it).text = "Eventos fracasados:"
				new Label(it)=>[
					value <=> "cantidadEventosFracasados"
				]
				new Label(it).text = "Entradas vendidas:"
				new Label(it)=>[
					value <=> "cantidadEntradasVendidas"
				]
				new Label(it).text = "Invitaciones enviadas:"
				new Label(it)=>[
					value <=> "cantidadInvitacionesEnviadas"
				]
				
				new Label(it).text = "  "
			]
	}
}
