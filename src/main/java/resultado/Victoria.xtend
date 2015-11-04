package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import duelos.Duelo

@Accessors
class Victoria extends Resultado{	
		
	override actualizarEstadisticas(Retador retador, Retador retado) {
		retador.aplicarActualizacionAlGanar
		retado.aplicarActualizacionAlPerder
	}
	
	override msj() {
		"Celebra tu victoria"
	}
	
	override veredicto() {
		"Ganaste"
	}
	
}