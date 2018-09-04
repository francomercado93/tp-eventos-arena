package gestionUsuarios

import ar.edu.usuarios.Usuario
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarUsuarioWindow extends TransactionalDialog<Usuario> {
	new(WindowOwner owner, Usuario model) {
		super(owner, model)
	    
		title = defaultTitle
	}

	def defaultTitle() {
		"Cambio de datos del Usuario"
	}

	override createFormPanel(Panel mainPanel) {
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
		
			new Label(form).text = "Tipo de usuario"
		
		new Selector<String>(form) => [
			allowNull(false)
			value <=> "tipoUsuario.mostrarDescripcion"
			val propiedadTipos = bindItems(new ObservableProperty(repoTipoUsuario, "lista"))
		  //(items <
		]
		
		
		new Label (form).text="fecha de nacimiento"
		new TextBox(mainPanel) => [
      width = 80
      (value <=> "nacimiento").transformer = new DateTransformer
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

		def getRepoTipoUsuario() {
		ApplicationContext.instance.getSingleton(typeof(String)) as RepoTipoUsuario
	}

}
