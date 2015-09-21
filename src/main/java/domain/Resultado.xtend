package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Resultado {
	
	Veredicto v1
	Veredicto v2
	
	new(Retador r1, Retador r2){
		this.v1 = new Ganador(r1)
		this.v2 = new Perdedor(r2)
	}
	
	def void actualizarEstadisticas() {
		v1.aplicarActualizacion
		v2.aplicarActualizacion
	}
	
}