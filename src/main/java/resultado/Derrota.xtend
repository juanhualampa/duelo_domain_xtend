package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import veredicto.Perdedor
import veredicto.Ganador

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2) {
		this.v1 = new Perdedor(r1)
		this.v2 = new Ganador(r2)
	}
	
}