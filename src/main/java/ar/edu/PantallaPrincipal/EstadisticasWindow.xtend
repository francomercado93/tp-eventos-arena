package ar.edu.PantallaPrincipal

import ar.edu.applicationModel.Estadisticas
import java.awt.Color
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import javax.swing.text.Highlighter.Highlight
import javax.swing.text.Highlighter.HighlightPainter

//dd
class EstadisticasWindow extends MainWindow<Estadisticas> {
	
	new(){
		super(new Estadisticas)
	}

	override createContents(Panel mainPanel) {
		this.title = "Event OS"
		
		new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
			
			new Label(it) =>[
				text = "Estadisticas:"
			] 
			new Label(it).text = ""
			
			new Label(it).text = "Cantidad total de eventos: "

			new Label(it) => [
				value <=> "cantidadTotalEventosOrganizados"
			]
			new Label(it).text = "Eventos ultimos mes: "
			new Label(it) => [
				value <=> "cantidadEventosUltimoMes"
			]
			new Label(it).text = "Eventos exitosos: "
			new Label(it) => [
				value <=> "cantidadEventosExitosos"
			]
			new Label(it).text = "Eventos fracados: "
			new Label(it) => [
				value <=> "cantidadEventosFracasados"
			]
			new Label(it).text = "Entradas vendidas: "
			new Label(it) => [
				value <=> "cantidadEntradasVendidas"
			]
			new Label(it).text = "Invitaciones enviadas: "
			new Label(it) => [
				value <=> "cantidadInvitacionesEnviadas"
			]
		]
	}
	
	def static void main(String[] args) {
		new EstadisticasWindow().startApplication
	}

}
