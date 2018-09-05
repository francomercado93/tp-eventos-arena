package ar.edu.usuarios.ui

import ar.edu.usuarios.TipoUsuario
import ar.edu.usuarios.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarUsuarioWindow extends TransactionalDialog<Usuario> {
	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			this.crearPanelIzquierdo(it)
			this.crearPanelDerecho(it)
		]
	}

	def crearPanelDerecho(Panel panel) {
		new Panel(panel) => [
			layout = new VerticalLayout
			new Label(it).text = "Email"

			new TextBox(it) => [
				(value <=> "mail")
				width = 200
			]

			new Label(it).text = "FechaNacimiento"

			new TextBox(it) => [
				visible()
				(value <=> "fechaNacimiento").transformer = new LocalDateTransformer
				width = 200
			]
			new Label(it).text = "Tipo de usuario:"

			new Selector(it) => [

				(items <=> "tiposPosibles").adapter = new PropertyAdapter(TipoUsuario, "descripcion")
				// visible()	
				value <=> "tipoUsuario"
			// onSelection(|modelObject.cambiarTipoUsuario())
			]
		]
	}

	def crearPanelIzquierdo(Panel panel) {
		new Panel(panel) => [
			layout = new VerticalLayout

			new Label(it).text = "Username:"

			new TextBox(it) => [
				value <=> "nombreUsuario"
				width = 200
			]

			new Label(it).text = "Nombre:"

			new TextBox(it) => [
				value <=> "nombre"
				width = 200
			]
			new Label(it).text = "Apellido:"

			new TextBox(it) => [
				value <=> "apellido"
				width = 200
			]
		]
	}

	override protected void addActions(Panel actions) {

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]

		]
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]
	}
}
