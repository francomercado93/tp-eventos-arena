package gestionUsuarios

import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.usuarios.TipoUsuario
import ar.edu.usuarios.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import ar.edu.usuarios.Free

@Accessors
@Observable
class GestionUsuarios {

	Usuario usuarioSeleccionado
  
      
     
      def crearUsuario(Usuario unUsuario) {

		getRepoUsuarios.create(unUsuario)

	}

	def eliminarUsuario() {
		getRepoUsuarios.delete(usuarioSeleccionado)
	}

	def actualizarUsuario() {
		getRepoUsuarios.update(usuarioSeleccionado)
		getRepoUsuarios.lista.add(usuarioSeleccionado)
		getRepoUsuarios.lista.remove(usuarioSeleccionado)
		
	}

	def updateMasivo() {}

	def RepositorioUsuarios getRepoUsuarios() {
		ApplicationContext.instance.getSingleton(typeof(Usuario))
	}

}
