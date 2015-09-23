package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import veredicto.Perdedor
import veredicto.Ganador

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2) {
		this.resultadoRetador = new Perdedor(r1)
		this.resultadoRetado = new Ganador(r2)
	}
	
}