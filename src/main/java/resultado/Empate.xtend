package resultado

import retador.Retador
import veredicto.ActualizadorEmpate

class Empate extends Resultado {
	
	new(Retador r1, Retador r2) {
		this.resultadoRetador = new ActualizadorEmpate(r1)
		this.resultadoRetado = new ActualizadorEmpate(r2)
	}
	
	
}