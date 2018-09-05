package ar.edu.PantallaPrincipal

import ar.edu.applicationModel.Estadisticas
import ar.edu.eventos.Locacion
import ar.edu.locaciones.ui.GestionarLocacionWindow
import ar.edu.servicios.Servicio
import ar.edu.servicios.TipoTarifa
import ar.edu.servicios.ui.GestionServiciosWindow
import ar.edu.usuarios.Usuario
import ar.edu.usuarios.ui.GestionUsuariosWindow
import java.awt.Color
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
			
			val panelArriba = new Panel(mainPanel)
			panelArriba.layout = new ColumnLayout(2)
			val panelAbajo = new Panel(mainPanel)
			panelAbajo.layout = new HorizontalLayout
			this.crearListadoEstadisticas(panelArriba)
			this.crearListadoUsuariosMasActivos(panelArriba)
			this.crearListadoLocacionesMasPopulares(panelAbajo)
			this.crearListadoServicios(panelAbajo)
	}
	
	def crearListadoServicios(Panel panel) {
		val panelServicios = new Panel(panel)
		new Label(panelServicios)=>[
			text = "Ultimos servicios:"
			foreground = Color.DARK_GRAY
			fontSize = 10
			alignLeft
			]
		val tablaServicios = new Table<Servicio>(panelServicios, typeof(Servicio))=>[
			items <=> "ultimosServiciosDadosDeAlta"
			setNumberVisibleRows(5)
		]
		new Column<Servicio>(tablaServicios)=>[
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("descripcion")
		]
		new Column<Servicio>(tablaServicios)=>[
			title = "Tarifa"
			fixedSize = 150
			bindContentsToProperty("tipoTarifa").transformer = [TipoTarifa tipoTarifa | "$ "+ tipoTarifa.costoFijo +" " + tipoTarifa.descripcionCorta ]
		]

		new Button(panelServicios) => [
			caption = "Gestion de servicios"
			onClick[ |new GestionServiciosWindow(this).open]
		]
	}
	
	def crearListadoLocacionesMasPopulares(Panel panel) {
		val panelLocaciones = new Panel(panel)
		new Label(panelLocaciones)=>[
			text = "Locaciones mas populares"
			alignLeft
			fontSize = 10
			foreground = Color.DARK_GRAY
			]
		val tablaLocacion = new Table<Locacion>(panelLocaciones, typeof(Locacion))=>[
			items <=> "locacionesMasPopulares"
			setNumberVisibleRows(5)
		]
		new Column<Locacion>(tablaLocacion)=>[
			title = "Nombre"
			bindContentsToProperty("descripcion")
			fixedSize = 150
		]
		new Column<Locacion>(tablaLocacion)=>[
			title= "Capacidad"
			bindContentsToProperty("capacidad")
			fixedSize = 150
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
				fixedSize = 100
  				bindContentsToProperty("nombreUsuario")
			]
			new Column<Usuario>(tablaUsrs) =>[
				title = "Nombre"
				fixedSize = 100
  				bindContentsToProperty("nombre")
			]
			new Column<Usuario>(tablaUsrs) =>[
				title = "Apellido"
				fixedSize = 100
  				bindContentsToProperty("apellido")
			]
			
			new Button(panelUsrs) => [
				caption = "Gestion de usuarios"
				onClick[ |new GestionUsuariosWindow(this).open]

			]
	}
	
	def crearListadoEstadisticas(Panel panel){
		val estaditiscasPanel = new Panel(panel)=>[
			new Label(it)=>[
				text = "Estadisticas"
				foreground = Color.DARK_GRAY
				fontSize = 10
				alignLeft
			]
		]
		
		new Panel(estaditiscasPanel) => [
			
			layout = new ColumnLayout(2)
			
			new Label(it)=>[
				text = "Cantidad total de eventos:"
			]
			new Label(it)=>[
				value <=> "cantidadTotalEventosOrganizados"
	
			]		
			new Label(it)=>[
				text = "Eventos Ultimo mes:"
			]
			new Label(it)=>[
				value <=> "cantidadEventosUltimoMes"
				alignRight
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
		]
	}
	

}
