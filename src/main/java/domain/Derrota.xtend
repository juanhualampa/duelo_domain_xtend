package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2){
		this.retador1 = r1
		this.retador2 = r2
	}	
	
	def nombreGanador(){
		retador1.jugador.nombre
	}
	
	def nombrePerdedor(){
		retador2.jugador.nombre
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		sosPerdedor(this.retador1)
		sosGanador(this.retador2)		
	}
	
	override visualizacion() {
		"Ganaste contra «nombrePerdedor», " //falta el tema de los puntos
	}
	
}