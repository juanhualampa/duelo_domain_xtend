package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import retador.Retador

/**
 * Representa el resultado de un duelo, posee el Ganador y Perdedor
 */
@Accessors
@Observable
abstract class Resultado {
	
	Retador retador
	Retador retado
	
	def void actualizarEstadisticas()
	
}