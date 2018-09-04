package gestionUsuarios

import ar.edu.eventos.ui.CrearUsuarioWindow
import ar.edu.eventos.ui.EditarUsuarioWindow
import ar.edu.usuarios.Usuario
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class GestionUsuariosWindow extends SimpleWindow<GestionUsuarios> {
	
	new(WindowOwner parent) {
		super(parent, new GestionUsuarios)
	}
	
	override createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			this.crearGridUsuarios(it)
			this.createGridActions(it)
		]
	}
	
	def createGridActions(Panel mainPanel) {
		val elementSelected = new NotNullObservable("usuarioSeleccionado")
		new Panel(mainPanel)=>[
			new Button(it) => [
				caption = "Editar"
				onClick([|this.editar])
				disableOnError
				bindEnabled(elementSelected)
			]
	
			new Button(it) => [
				caption = "Eliminar"
				onClick([|modelObject.eliminar])
				disableOnError
				bindEnabled(elementSelected)
			]
	
			new Button(it) => [
				caption = "Nuevo usuario"
				onClick([|this.crear])
			]
			
			new Button(it) => [
				caption = "Update masivo"
				onClick([|modelObject.updateMasivo])
				setAsDefault
			]
		]
	}
	
	def crearGridUsuarios(Panel mainPanel) {
		new Panel(mainPanel) => [
			val table = new Table<Usuario>(it, typeof(Usuario)) => [
				items <=> "repositorio.lista"
				value <=> "usuarioSeleccionado"
				numberVisibleRows = 8
			]
			new Column<Usuario>(table) => [
				title = "UserName"
				fixedSize = 200
				bindContentsToProperty("nombreUsuario")
			]
	
			new Column<Usuario>(table) => [
				title = "Nombre y Apellido"
				fixedSize = 100
				alignRight
				bindContentsToProperty("nombreApellido")
			]
	
			new Column<Usuario>(table) => [
				title = "Email"
				fixedSize = 200
				bindContentsToProperty("mail")
			]
		]
	}
	// ** Acciones
	// ********************************************************
	def void crear() {
		val usuario = new Usuario
		new CrearUsuarioWindow(this, usuario) => [
			onAccept[this.modelObject.crear(usuario)]
			open
		]
	}

	def void editar() {
		new EditarUsuarioWindow(this, modelObject.usuarioSeleccionado) => [
			onAccept[this.modelObject.actualizar()]
			open
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	}

}
