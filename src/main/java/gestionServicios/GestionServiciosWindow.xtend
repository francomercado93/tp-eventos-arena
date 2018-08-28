package gestionServicios


import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import ar.edu.servicios.Servicio


class GestionServiciosWindow extends SimpleWindow<GestionServicios>{

	new(WindowOwner parent) {
		super(parent, new GestionServicios)
	
		title = "Gestion de Servicios"

	}

	override createContents(Panel mainPanel) {

		super.createMainTemplate(mainPanel)

		this.createResultsGrid(mainPanel)

	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Editar"
			onClick([|this.editarServicio])
			setAsDefault
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Eliminar"
			onClick([|modelObject.eliminarServicio])
		]

		new Button(actionsPanel) => [
			caption = "Nuevo Servicio"
			onClick([|this.crearServicio])
		]
	}

	def protected createResultsGrid(Panel mainPanel) {
		val table = new Table<Servicio>(mainPanel, typeof(Servicio)) => [
			items <=> "repoServicios.lista"
			value <=> "servicioSeleccionado"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}

	def void describeResultsGrid(Table<Servicio> table) {
		new Column<Servicio>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("descripcion")
		]

		new Column<Servicio>(table) => [
			title = "Tarifa Por Kilometro"
			fixedSize = 100
			alignRight
			bindContentsToProperty("tarifaPorKilometro")
		]

		new Column<Servicio>(table) => [
			title = "Ubicacion"
			fixedSize = 200
			bindContentsToProperty("ubicacionServicio")
		]

	}

	// ** Acciones
	// ********************************************************
	def void crearServicio() {
		val servicio = new Servicio
		new CrearServicioWindow(this, servicio) => [
			onAccept[this.modelObject.crearServicio(servicio)]
			open
		]
	}

	def void editarServicio() {
		new EditarServicioWindow(this, modelObject.servicioSeleccionado) => [
			onAccept[this.modelObject.actualizarServicio()]
			open
		]
	}

	override protected createFormPanel(Panel mainPanel) {
	}





}
	
