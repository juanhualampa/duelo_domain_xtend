package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import duelos.Duelo

@Accessors
class Derrota extends Resultado{
		
	override actualizarEstadisticas(Duelo duelo) {
		duelo.retado.aplicarActualizacionAlGanar(duelo)
		duelo.retador.aplicarActualizacionAlPerder(duelo)
	}
}