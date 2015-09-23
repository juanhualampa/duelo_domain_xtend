package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import veredicto.Veredicto

/**
 * Representa el resultado de un duelo, posee el Ganador y Perdedor
 */
@Accessors
@Observable
abstract class Resultado {
	
	Veredicto resultadoRetador
	Veredicto resultadoRetado
	
	def void actualizarEstadisticas() {
		resultadoRetador.aplicarActualizacion
		resultadoRetado.aplicarActualizacion
	}
	
}