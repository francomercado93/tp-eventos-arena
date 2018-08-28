package gestionUsuarios

import ar.edu.usuarios.Free
import ar.edu.usuarios.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
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
	    
		title = defaultTitle
	}

	def defaultTitle() {
		"Cambio de datos del Usuario"
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Username"

		new TextBox(form) => [
			value <=> "nombreUsuario"
			width = 200
		]

		new Label(form).text = "Nombre y apellido"

		new TextBox(form) => [
			value <=> "nombreApellido"
			width = 200
		]

		new Label(form).text = "Email"

		new TextBox(form) => [
			value <=> "mail"
			width = 200
		]
		
		new Selector<String>(form) => [
			allowNull(false)
			//Hay que usar un convertidor que pase del tipo de usuario a un String			
			items <=> "tipoUsuario"
            value<=>"tipoUsuario"
		]
	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|
				this.cancel
			]
		]
	}

}
