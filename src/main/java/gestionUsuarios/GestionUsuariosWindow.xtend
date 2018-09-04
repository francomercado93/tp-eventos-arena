 package gestionUsuarios

import ar.edu.usuarios.Usuario
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
	
		title = "Gestion de Usuarios"

	}

	override createContents(Panel mainPanel) {

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)

	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarUsuario])
			setAsDefault
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|modelObject.eliminarUsuario])
		]

		new Button(actionsPanel) => [
			caption = "Nuevo Usuario"
			onClick([|this.crearUsuario])
		]
	}

	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Usuario>(mainPanel, typeof(Usuario)) => [
			items <=> "repoUsuarios.lista"
			value <=> "usuarioSeleccionado"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}

	def void describeResultsGrid(Table<Usuario> table) {
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

	}

	// ** Acciones
	// ********************************************************
	def void crearUsuario() {
		val usuario = new Usuario
		new CrearUsuarioWindow(this, usuario) => [
			onAccept[this.modelObject.crearUsuario(usuario)]
			open
		]
	}

	def void editarUsuario() {
		new EditarUsuarioWindow(this, modelObject.usuarioSeleccionado) => [
			onAccept[this.modelObject.actualizarUsuario()]
			open
		]
	}

	override createFormPanel(Panel mainPanel) {
	}

}
