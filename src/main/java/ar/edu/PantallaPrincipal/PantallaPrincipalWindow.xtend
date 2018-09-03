package ar.edu.PantallaPrincipal

import ar.edu.applicationModel.Estadisticas
import ar.edu.usuarios.Usuario
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
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
//	override createMainTemplate(Panel mainPanel) {
//		super.createMainTemplate(mainPanel)
//		//this.createResultsGrid(mainPanel)
//		//this.createGridActions(mainPanel)
//	}

	override protected addActions(Panel actionsPanel) {

	}

	override protected createFormPanel(Panel mainPanel) {		
	}
	
	override createMainTemplate(Panel mainPanel){
			val contentPanel1 = new Panel(mainPanel)
			contentPanel1.layout = new HorizontalLayout() 
			this.crearListadoEstadisticas(contentPanel1)
			this.crearListadoUsuariosMasActivos(contentPanel1)
	}
	
	def crearListadoUsuariosMasActivos(Panel contentPanel1) {
		val panelUsrs = new Panel(contentPanel1)=>[
			layout = new VerticalLayout()
			]
			new Label(panelUsrs).text = "Usuarios mas activos:"	
			val tablaUsrs = new Table<Usuario>(panelUsrs, typeof(Usuario))=>[
				items <=> "usuariosMasActivos"
				setNumberVisibleRows(5)
			]
		
			new Column<Usuario>(tablaUsrs) =>[
				title = "Username"
				fixedSize = 200
  				bindContentsToProperty("nombreUsuario")
			]
			new Column<Usuario>(tablaUsrs) =>[
				title = "Nombre y apellido"
				fixedSize = 200
  				bindContentsToProperty("nombreApellido")
			]
	}
	
	def crearListadoEstadisticas(Panel contentPanel1){
		new Panel(contentPanel1) => [
			layout = new ColumnLayout(2)
				new Label(it).text = "Estadisticas:"
				new Label(it).text = ""
				new Label(it).text = "Cantidad total de eventos:"
				new Label(it)=>[
					value <=> "cantidadTotalEventosOrganizados"
				]
				new Label(it).text = "Eventos Ultimo mes:"
				new Label(it)=>[
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
			]
	}
}
