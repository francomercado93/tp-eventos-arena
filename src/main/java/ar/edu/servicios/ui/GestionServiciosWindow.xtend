package ar.edu.servicios.ui

import ar.edu.applicationModel.GestionServicios
import ar.edu.servicios.Servicio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

@Accessors
class GestionServiciosWindow extends SimpleWindow<GestionServicios> {

	new(WindowOwner parent) {
		super(parent, new GestionServicios)
		title = "Gestion de Servicios"
	}

	def createGridActions(Panel panel) {
		val elementSelected = new NotNullObservable("servicioSeleccionado")
		new Panel(panel) => [
			layout = new VerticalLayout
			new Button(it) => [
				caption = "Editar"
				onClick([|this.editarServicio])
				bindEnabled(elementSelected)
			]

			new Button(it) => [
				caption = "Eliminar"
				onClick([|modelObject.eliminar])
				bindEnabled(elementSelected)
			]

			new Button(it) => [
				caption = "Nuevo servicio"
				onClick([|this.crearServicio])
				setAsDefault
			]
			new Button(it) => [
				caption = "Update masivo"
				onClick([|modelObject.updateMasivo])
			]
		]
	}

	// ** Acciones
	// ********************************************************
	def void crearServicio() {
		val servicio = new Servicio
		new CrearServicioWindow(this, servicio) => [
			onAccept[this.modelObject.crear(servicio)]
			open
		]
	}

	def void editarServicio() {
		new EditarServicioWindow(this, modelObject.servicioSeleccionado) => [
			onAccept[this.modelObject.actualizar()]
			open
		]
	}

	override protected createFormPanel(Panel mainPanel) {
		new Panel(mainPanel) => [
			layout = new HorizontalLayout
			this.crearGridServicios(it)
			this.createGridActions(it)
		]
	}

	def crearGridServicios(Panel panel) {
		new Panel(panel) => [
			val table = new Table<Servicio>(it, typeof(Servicio)) => [
				items <=> "repositorio.lista"
				value <=> "servicioSeleccionado"
				numberVisibleRows = 8
			]
			new Column<Servicio>(table) => [
				title = "Nombre"
				fixedSize = 100
				bindContentsToProperty("descripcion")
			]

			new Column<Servicio>(table) => [
				title = "Tarifa Por Kilometro"
				fixedSize = 60
				alignRight
				bindContentsToProperty("tarifaPorKilometro")
			]

			new Column<Servicio>(table) => [
				title = "Ubicacion"
				fixedSize = 150
				bindContentsToProperty("ubicacionServicio")
			]
		]
	}

	override protected addActions(Panel actionsPanel) {
	}

}
