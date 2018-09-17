package ar.edu.servicios.ui

import ar.edu.servicios.Servicio
import ar.edu.servicios.TipoTarifa
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.bindings.ValueTransformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.geodds.Point

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
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)

			new Label(it).text = "Nombre:"

			new TextBox(it) => [
				value <=> "descripcion"
				width = 200
			]

			crearPanelCoordenadas(it)

			new Label(it).text = "Tarifa por kilometro:"

			new NumericField(it) => [
				value <=> "tarifaPorKilometro"
				width = 100
			]

			new Label(it).text = "Tipo tarifa actual:"
			new Label(it).value <=> "tipoTarifa.descripcion"
			new Selector(it) => [
				allowNull(false)
				(items <=> "tiposPosibles").adapter = new PropertyAdapter(TipoTarifa, "descripcion")
				(value <=> "tipoTarifa")

			]
			new Label(it).text = ""

			new Label(it).text = "Costo fijo"

			new NumericField(it) => [
				value <=> "nuevaTarifa"
				width = 100
			]

		]
	}

	def crearPanelCoordenadas(Panel panel) {

		new Label(panel).text = "Coordenada x:"
		new TextBox(panel) => [
			(value <=> "coordX")
			width = 100
		]

		new Label(panel).text = "Coordenada y:"
		new TextBox(panel) => [
			(value <=> "coordY")
			width = 100
		]
	}

	override addActions(Panel actions) {
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
