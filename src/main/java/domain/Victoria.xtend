package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Victoria extends Resultado{
	
	new(Retador r1, Retador r2){
		this.retador1 = r1
		this.retador2 = r2
	}
		
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		retador.aplicarVeredicto(new Ganador)
		retado.aplicarVeredicto(new Perdedor)
	}	
	
	
}