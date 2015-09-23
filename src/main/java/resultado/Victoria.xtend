package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import veredicto.ActualizadorGanador
import veredicto.ActualizadorPerdedor

@Accessors
class Victoria extends Resultado{	
	
	new(Retador r1, Retador r2){
		this.retador = r1
		this.retado = r2
	}
			
	override actualizarEstadisticas() {
		new ActualizadorGanador().aplicarActualizacion(retador)
		new ActualizadorPerdedor().aplicarActualizacion(retado)
	}
	
	
	
	
}