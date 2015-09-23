package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import veredicto.Veredicto

@Accessors
@Observable
abstract class Resultado {
	
	Veredicto v1
	Veredicto v2
	
	
	def void actualizarEstadisticas() {
		v1.aplicarActualizacion
		v2.aplicarActualizacion
	}
	
}