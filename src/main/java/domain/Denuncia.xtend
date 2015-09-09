package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Denuncia {
	
	Duelo contexto	
	Motivo unMotivo	
	Descripcion unaDescripcion
	
	new(Duelo contexto, Motivo unMotivo, Descripcion unaDescripcion) {
    	this.contexto = contexto
    	this.unMotivo = unMotivo
    	this.unaDescripcion = unaDescripcion
    }
    
    def void castigar() {
    	if(calcularValidez())
    		unMotivo.evaluarse(this,contexto)	//cada motivo sabe evaluarse y castigar si corresponde
    	else {
    		new AbusoDelSistemaDeDenuncias().evaluarse(this,contexto)    		
    		}
    }
    
	
	def calcularValidez() {
		 return true
		 //return unaDescripcion.poseeMenosDe20Caracteres() || unaDescripcion.sonMenosDe3Palabras()
	}
	
	def getMotivosPosibles(){
		#[new ComunicacionAbusiva, new AbusoDeHabilidad, new FeedIntencional]
	}

}
