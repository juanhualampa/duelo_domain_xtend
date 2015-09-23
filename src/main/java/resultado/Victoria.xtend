package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import resultado.Resultado
import veredicto.ActualizadorGanador
import veredicto.ActualizadorPerdedor

@Accessors
class Victoria extends Resultado{	
	
	new(Retador r1, Retador r2){
		this.resultadoRetador = new ActualizadorGanador(r1)
		this.resultadoRetado = new ActualizadorPerdedor(r2)
	}
			
	override actualizarEstadisticas() {
		getResultadoRetador.aplicarActualizacion
		getResultadoRetado.aplicarActualizacion
	}
	
	
	
	
}