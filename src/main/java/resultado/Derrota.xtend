package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import veredicto.ActualizadorGanador
import veredicto.ActualizadorPerdedor

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2) {
		this.resultadoRetador = new ActualizadorPerdedor(r1)
		this.resultadoRetado = new ActualizadorGanador(r2)
	}
	
}