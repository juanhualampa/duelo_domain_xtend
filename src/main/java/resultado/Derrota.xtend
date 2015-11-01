package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import duelos.Duelo

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2){
		this.retador = r1
		this.retado = r2
	}
			
	override actualizarEstadisticas(Duelo duelo) {
		this.retado.aplicarActualizacionAlGanar(duelo)
		this.retador.aplicarActualizacionAlPerder(duelo)	
	}
	
}