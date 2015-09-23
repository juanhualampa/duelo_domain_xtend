package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import veredicto.ActualizadorGanador
import veredicto.ActualizadorPerdedor

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2){
		this.retador = r1
		this.retado = r2
	}
			
	override actualizarEstadisticas() {
		new ActualizadorPerdedor().aplicarActualizacion(retador)
		new ActualizadorGanador().aplicarActualizacion(retado)		
	}
	
}