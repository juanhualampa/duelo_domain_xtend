package resultado

import retador.Retador
import veredicto.Empate

class Empatados extends Resultado {
	
	new(Retador r1, Retador r2) {
		this.resultadoRetador = new Empate(r1)
		this.resultadoRetado = new Empate(r2)
	}
	
	
}