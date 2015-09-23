package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import retador.Retador
import duelos.Duelo
import duelos.Motivo
import duelos.AbusoDelSistemaDeDenuncias

/**
 * Modela una denuncia de un jugador a otro. 
 * <p>Posee un contexto, motivo y descripcion que deben ser evaluadas para verificar la validez de la misma
 */
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
    
    def castigar() {
    	cambioMotivoSiNoEsValido
    	this.unMotivo.evaluarse(this)    
    }
	
	def cambioMotivoSiNoEsValido() {
		if (!calcularValidez)
    		this.unMotivo = new AbusoDelSistemaDeDenuncias()
	}
	
	def boolean calcularValidez() {
		// TODO: FALTA VER EN EL REGEX PARA EL CASO EN QUE ALGUIEN SOLO PONGA BARRAS ESPACIADORAS, OSEA
		//QUE LOS ESPACIOS NO VALGAN COMO PALABRAS
		 return (unaDescripcion.poseeAlMenos20Caracteres || unaDescripcion.sonAlMenos3Palabras)
	}
		
	def aplicarPenalidad(Retador retador) {
		retador.jugador.recibioDenuncia(this)
	}

}
