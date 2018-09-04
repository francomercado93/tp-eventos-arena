package gestionLocaciones

import ar.edu.eventos.Locacion
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarLocacionWindow extends TransactionalDialog<Locacion> {

	new(WindowOwner owner, Locacion model) {
		super(owner, model)
	}

	override createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)

			new Label(it).text = "Nombre:"

			new TextBox(it) => [
				value <=> "descripcion"
				width = 200
			]

			new Label(it).text = "Superficie:"

			new TextBox(it) => [
				value <=> "superficie"
				width = 200
			]

			new Label(it).text = "Ubicacion:"
			crearPanelCoordenadas(it)
		]

	}

	def crearPanelCoordenadas(Panel panel) {
		new Panel(panel) => [
			layout = new ColumnLayout(2)
			new Label(it).text = "Coordenada x:"
			new TextBox(it) => [
				(value <=> "puntoGeografico.x")
				width = 100
			]
			new Label(it).text = "Coordenada y:"
			new TextBox(it) => [
				(value <=> "puntoGeografico.y")
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
			onClick [|this.cancel]
		]
	}
}
