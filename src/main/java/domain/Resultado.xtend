package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Resultado {
	Retador retador1
	Retador retador2
		
	def String visualizacionParteSuperior()
	
	def String visualizacionInferior()
	
	def void aplicarActualizacionesAEstadisticas(Duelo duelo) 
	
	def aplicarVeredicto(Retador it, Veredicto v) {
		setPostDuelo(v)
		it.actualizarEstadisticasDelRetador
	}
	
}