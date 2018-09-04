//package gestionLocaciones
//
//import ar.edu.eventos.Locacion
//import org.uqbar.arena.widgets.Button
//import org.uqbar.arena.widgets.Panel
//import org.uqbar.arena.widgets.tables.Column
//import org.uqbar.arena.widgets.tables.Table
//import org.uqbar.arena.windows.SimpleWindow
//import org.uqbar.arena.windows.WindowOwner
//
//import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
//
//class GestionarLocacionWindow  extends SimpleWindow<GestionarLocacion> {
//	
//	new(WindowOwner parent) {
//		super(parent, new GestionarLocacion)
//	
//		title = "Gestion de Locaciones"
//
//	}
//
//	override createContents(Panel mainPanel) {
//
//		super.createMainTemplate(mainPanel)
//
//		this.createResultsGrid(mainPanel)
//
//	}
//
//	override protected addActions(Panel actionsPanel) {
//
//		new Button(actionsPanel) => [
//			caption = "Editar"
//			onClick([|this.editarLocacion])
//			setAsDefault
//			disableOnError
//		]
//
//		new Button(actionsPanel) => [
//			caption = "Eliminar"
//			onClick([|modelObject.eliminarLocacion])
//		]
//
//		new Button(actionsPanel) => [
//			caption = "Nueva Locacion"
//			onClick([|this.crearLocacion])
//		]
//	}
//
//	def protected createResultsGrid(Panel mainPanel) {
//		val table = new Table<Locacion>(mainPanel, typeof(Locacion)) => [
//			items <=> "repoLocacion.lista"
//			value <=> "locacionSeleccionada"
//			numberVisibleRows = 8
//		]
//		this.describeResultsGrid(table)
//	}
//
//	def void describeResultsGrid(Table<Locacion> table) {
//		new Column<Locacion>(table) => [
//			title = "Nombre"
//			fixedSize = 200
//			bindContentsToProperty("descripcion")
//		]
//
//		new Column<Locacion>(table) => [
//			title = "Superficie"
//			fixedSize = 100
//			alignRight
//			bindContentsToProperty("superficie")
//		]
//
//		new Column<Locacion>(table) => [
//			title = "coordenadas"
//			fixedSize = 200
//			bindContentsToProperty("puntoGeografico")
//		]
//
//	}
//
//	// ** Acciones
//	// ********************************************************
//	def void crearLocacion() {
//		val locacion = new Locacion
//		new CrearLocacionWindow(this, locacion) => [
//			onAccept[this.modelObject.crearLocacion(locacion)]
//			open
//		]
//	}
//
//	def void editarLocacion() {
//		new EditarLocacionWindow(this, modelObject.locacionSeleccionada) => [
//			onAccept[this.modelObject.actualizarLocacion()]
//			open
//		]
//	}
//
//	override createFormPanel(Panel mainPanel) {
//	}
//	
//	
//}