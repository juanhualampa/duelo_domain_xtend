package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import duelos.Duelo

@Accessors
class Victoria extends Resultado{	
		
	override actualizarEstadisticas(Duelo duelo) {
		duelo.retador.aplicarActualizacionAlGanar(duelo)
		duelo.retado.aplicarActualizacionAlPerder(duelo)
	}
	
}