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
<<<<<<< HEAD
=======
	
>>>>>>> c02b55eac04e01c6b4280705b488b16ebd7a37eb
	
	def void actualizarEstadisticas() {
		resultadoRetador.aplicarActualizacion
		resultadoRetado.aplicarActualizacion
	}
	
}