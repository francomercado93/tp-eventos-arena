package gestionServicios

import ar.edu.servicios.Servicio
import ar.edu.servicios.TipoTarifa
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
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

			new Label(it).text = "Tipo tarifa:"

			new Selector(it) => [
				(items <=> "tiposPosibles").adapter = new PropertyAdapter(TipoTarifa, "descripcion")
				value <=> "tipoTarifa"
			// onSelection[|this.editarTipoTarifa()]
			]

			new Label(it).text = "Costo fijo"

			new NumericField(it) => [
				value <=> "tipoTarifa.costoFijo"
				width = 100
			]

		]
	}

	def crearPanelCoordenadas(Panel panel) {

		new Label(panel).text = "Ubicacion:"

		new Panel(panel) => [
			layout = new ColumnLayout(2)
			new Label(it).text = "Coordenada x:"
			new TextBox(it) => [
				(value <=> "ubicacionServicio.x")
				width = 100
			]
			new Label(it).text = "Coordenada y:"
			new TextBox(it) => [
				(value <=> "ubicacionServicio.y")
				width = 100
			]
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
