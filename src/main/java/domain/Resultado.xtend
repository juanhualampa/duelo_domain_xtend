package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Resultado {
	Retador retador1
	Retador retador2
	
	new(Retador ganador, Retador perdedor) {
		this.retador1 = ganador
		this.retador2 = perdedor
	}
	
	def String visualizacion()
	
	def void aplicarActualizacionesAEstadisticas(Duelo duelo) 
	
}