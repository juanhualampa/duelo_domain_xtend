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
    
    def Jugador castigar() {
    	
    }
    
	
	def calcularValidez() {
		/*
		 * Deberia decirme si es fake y no, y con esa informacion que se hace???
		 * 
		 */ 
		
		(unaDescripcion.poseeMenosDe20Caracteres() || unaDescripcion.sonMenosDe3Palabras())
	}
	
	def void getObtenerJugadorACastigar() {
		if(calcularValidez())
    		unMotivo.evaluarse()	//cada motivo sabe evaluarse y castigar si corresponde
    	else {
    		val abuso = new AbusoDelSistemaDeDenuncias()	//podria ir el string de pantalla
    		abuso.sancionar(this)
    		
    		}
	}
	
}
