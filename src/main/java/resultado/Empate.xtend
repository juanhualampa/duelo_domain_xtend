package resultado

import retador.Retador
import duelos.Duelo

class Empate extends Resultado {
		
	override actualizarEstadisticas(Retador retador, Retador retado) {
		retador.aplicarActualizacionAlEmpatar
		retado.aplicarActualizacionAlEmpatar
	}
	
	override msj() {
		"Sigue practicando"
	}
	
	override saludo() {
		"Empataste"
	}
	
}