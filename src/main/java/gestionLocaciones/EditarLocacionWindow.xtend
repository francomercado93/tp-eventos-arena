package gestionLocaciones

import ar.edu.eventos.Locacion
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarLocacionWindow extends TransactionalDialog<Locacion>{
	new(WindowOwner owner, Locacion model) {
		super(owner, model)
		title = defaultTitle
		}
		
		def defaultTitle() {
		"Cambio de datos de la Locacion"
		}
		
		override createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(form).text = "Nombre"

		new TextBox(form) => [
			value <=> "descripcion"
			width = 200
		]

		new Label(form).text = "Superficie"

		new TextBox(form) => [
			value <=> "superficie"
			width = 200
		]

		new Label(form).text = "coordenada X"

		new NumericField(form) => [
			value <=> "coordenadaX"
			width = 200
		]
		
		new Label(form).text = "coordenada Y"

		new NumericField(form) => [
			value <=> "coordenadaY"
			width = 200
		]
		new Label(form).text = "coordenadas"
			new Label(mainPanel) => [
			value <=> "puntoGeograficos"
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