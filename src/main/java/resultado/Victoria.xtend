package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import duelos.Duelo

@Accessors
class Victoria extends Resultado{	
	
	new(Retador r1, Retador r2){
		this.retador = r1
		this.retado = r2
	}
			
	override actualizarEstadisticas(Duelo duelo) {
		this.retador.aplicarActualizacionAlGanar(duelo)
		this.retado.aplicarActualizacionAlPerder(duelo)
	}
	
	
	
	
	
	
}