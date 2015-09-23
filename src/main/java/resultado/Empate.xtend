package resultado

import retador.Retador
import veredicto.ActualizadorEmpate

class Empate extends Resultado {
		
	new(Retador r1, Retador r2){
		actualizarEstadisticas(r1,r2)
		//this.retador = r1
		//this.retado = r2
	}
			
	override actualizarEstadisticas(Retador retador, Retador retado) {
		new ActualizadorEmpate().aplicarActualizacion(retador)
		new ActualizadorEmpate().aplicarActualizacion(retado)
	}
	
	
}