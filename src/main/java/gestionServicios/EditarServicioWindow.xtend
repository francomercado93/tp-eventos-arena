package gestionServicios

import ar.edu.servicios.Servicio
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarServicioWindow extends TransactionalDialog<Servicio> {
	new(WindowOwner owner, Servicio model) {
		super(owner, model)
	    
		title = defaultTitle
	}

	def defaultTitle() {
		"Cambio de datos del Servicio"
	}

	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Nombre"

		new TextBox(form) => [
			value <=> "descripcion"
			width = 200
		]

		new Label(form).text = "Tarifa por kilometro"

		new NumericField(form) => [
			value <=> "tarifaPorKilometro"
			width = 100
		]
		new Label(form).text = "Ubicacion"

		new NumericField(form) => [
			value <=> "ubicacionServicio"
			width = 100
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
