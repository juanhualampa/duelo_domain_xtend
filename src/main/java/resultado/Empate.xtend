package resultado

import retador.Retador
import duelos.Duelo

class Empate extends Resultado {
		
	override actualizarEstadisticas(Duelo duelo) {
		duelo.retador.aplicarActualizacionAlEmpatar(duelo)
		duelo.retado.aplicarActualizacionAlEmpatar(duelo)
	}
	
}