package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import veredicto.Ganador
import veredicto.Perdedor

@Accessors
class Victoria extends Resultado{	
	
	new(Retador r1, Retador r2){
		this.v1 = new Ganador(r1)
		this.v2 = new Perdedor(r2)
	}
			
	override actualizarEstadisticas() {
		v1.aplicarActualizacion
		v2.aplicarActualizacion
	}
	
	
	
	
}