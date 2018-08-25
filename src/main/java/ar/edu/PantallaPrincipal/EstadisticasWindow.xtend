package ar.edu.PantallaPrincipal

import ar.edu.main.Estadisticas
import java.awt.Color
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.MainWindow

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
//dd
class EstadisticasWindow extends MainWindow<Estadisticas>{
	new(){
		super(new Estadisticas)
	}
	
	override createContents(Panel mainPanel) {
		this.title = "Event OS"
		new Label(mainPanel).text = "Estadisticas"
		new Label(mainPanel) =>[
			background = Color.GREEN
			value <=> "cantidadTotalEventosOrganizados"
		]
	}
	def static void main(String[] args) {
		new EstadisticasWindow().startApplication
	}
	
}