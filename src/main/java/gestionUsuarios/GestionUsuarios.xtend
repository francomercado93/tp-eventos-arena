package gestionUsuarios

import ar.edu.repositorios.RepositorioUsuarios
import ar.edu.usuarios.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

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
	}

	def updateMasivo() {}

	def RepositorioUsuarios getRepoUsuarios() {
		ApplicationContext.instance.getSingleton(typeof(Usuario))
	}

}
