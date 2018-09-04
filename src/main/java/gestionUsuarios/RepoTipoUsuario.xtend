package gestionUsuarios

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class RepoTipoUsuario {
	
	List <String> tipoUsuarios=newArrayList
	
	def List <String> lista(){
		tipoUsuarios
	}

}