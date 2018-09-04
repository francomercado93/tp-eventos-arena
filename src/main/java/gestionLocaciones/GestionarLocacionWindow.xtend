package gestionLocaciones

import ar.edu.eventos.Locacion
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class GestionarLocacionWindow extends SimpleWindow<GestionarLocacion> {

	new(WindowOwner parent) {
		super(parent, new GestionarLocacion)
	}

	override createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			this.crearGridLocaciones(it)
			this.createGridActions(it)
		]
	}

	def createGridActions(Panel mainPanel) {
		val elementSelected = new NotNullObservable("locacionSeleccionada")
		new Panel(mainPanel) => [
			new Button(it) => [
				caption = "Editar"
				onClick([|this.editar])
				disableOnError
				bindEnabled(elementSelected)
			]

			new Button(it) => [
				caption = "Eliminar"
				onClick([|modelObject.eliminar])
				disableOnError
				bindEnabled(elementSelected)
			]

			new Button(it) => [
				caption = "Nueva Locacion"
				onClick([|this.crear])
			]

			new Button(it) => [
				caption = "Update masivo"
				onClick([|modelObject.updateMasivo])
				setAsDefault
			]
		]
	}

	def crearGridLocaciones(Panel mainPanel) {
		new Panel(mainPanel) => [
			val table = new Table<Locacion>(it, typeof(Locacion)) => [
				items <=> "repositorio.lista"
				value <=> "locacionSeleccionada"
				numberVisibleRows = 8
			]
			
			new Column<Locacion>(table) => [
				title = "Nombre"
				fixedSize = 100
				bindContentsToProperty("descripcion")
			]
	
			new Column<Locacion>(table) => [
				title = "Superficie"
				fixedSize = 100
				alignRight
				bindContentsToProperty("superficie")
			]
	
			new Column<Locacion>(table) => [
				title = "coordenadas"
				fixedSize = 100
				bindContentsToProperty("puntoGeografico")
			]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
	}

	// ** Acciones
	// ********************************************************
	def void crear() {
		val locacion = new Locacion
		new CrearLocacionWindow(this, locacion) => [
			onAccept[this.modelObject.crear(locacion)]
			open
		]
	}

	def void editar() {
		new EditarLocacionWindow(this, modelObject.locacionSeleccionada) => [
			onAccept[this.modelObject.actualizar()]
			open
		]
	}
}
