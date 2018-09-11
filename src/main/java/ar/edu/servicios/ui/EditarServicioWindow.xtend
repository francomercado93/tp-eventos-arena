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

//			new Label(it).text = "Tipo tarifa:"
//
//			new Selector(it) => [
//				allowNull(false)
//				(items <=> "tiposPosibles").adapter = new PropertyAdapter(TipoTarifa, "descripcion")
//				(value <=> "tipoTarifa")
//	
//			]

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
			new Label(it) => [
				(value <=> "coordenadaX")  
			
				width = 100
			]
			new Label(it).text = "Coordenada y:"
			new Label(it) => [
				(value <=> "coordenadaY")
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
@Accessors
class CoordenadaTransformer implements ValueTransformer<Point, Double>{
	Double coordX
	Double coordY
	
	override getModelType() {
		Point
	}
	
	override getViewType() {
		Double
	}
	
	override modelToView(Point valueFromModel) {
		coordX = valueFromModel.x
		coordY = valueFromModel.y
	}
	
	override viewToModel(Double valueFromView) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

