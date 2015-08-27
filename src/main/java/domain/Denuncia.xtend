package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Denuncia {
	
	Jugador denunciante	
	Jugador denunciado	
	Motivo unMotivo	
	Descripcion unaDescripcion
	
	new(Jugador denunciante, Jugador denunciado, Motivo unMotivo, Descripcion unaDescripcion) {
    	this.denunciante = denunciante
    	this.denunciado = denunciado
    	this.unMotivo = unMotivo
    	this.unaDescripcion = unaDescripcion
  }
	
	def calcularValidez(Motivo motivo) {
		/*
		 * Deberia decirme si es fake y no, y con esa informacion que se hace???
		 * 
		 */ 
		
		(unaDescripcion.poseeMenosDe20Caracteres() || unaDescripcion.sonMenosDe3Palabras())
	}
	
}
