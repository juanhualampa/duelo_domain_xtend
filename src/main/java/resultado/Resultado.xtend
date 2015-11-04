package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import retador.Retador
import duelos.Duelo

/**
 * Representa el resultado de un duelo, posee el Ganador y Perdedor
 */
@Accessors
@Observable
abstract class Resultado {
		
	def void actualizarEstadisticas(Retador retador, Retador retado )
	
	def String msj()
	
	def String veredicto()
	
}