package resultado

import retador.Retador
import veredicto.Empate

class Empatados extends Resultado {
	
	new(Retador r1, Retador r2) {
		this.v1 = new Empate(r1)
		this.v2 = new Empate(r2)
	}
	
	
}