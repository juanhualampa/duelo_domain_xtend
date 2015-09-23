package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import veredicto.ActualizadorGanador
import veredicto.ActualizadorPerdedor

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2){
		actualizarEstadisticas(r1,r2)
		//this.retador = r1
		//this.retado = r2
	}
			
	override actualizarEstadisticas(Retador retador, Retador retado) {
		new ActualizadorPerdedor().aplicarActualizacion(retador)
		new ActualizadorGanador().aplicarActualizacion(retado)		
	}
	
}