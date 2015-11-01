package resultado

import retador.Retador
import duelos.Duelo

class Empate extends Resultado {
		
	new(Retador r1, Retador r2){
		this.retador = r1
		this.retado = r2
	}
			
	override actualizarEstadisticas(Duelo duelo) {
		this.retador.aplicarActualizacionAlEmpatar(duelo)
		this.retado.aplicarActualizacionAlEmpatar(duelo)
	}
	
	
}