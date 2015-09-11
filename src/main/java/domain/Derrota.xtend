package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Derrota extends Resultado{
		
	new(Retador ganador, Retador perdedor) {
		super(ganador,perdedor)
	}
	
	def nombreGanador(){
		retador1.jugador.nombre
	}
	
	def nombrePerdedor(){
		retador2.jugador.nombre
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo duelo) {
		duelo.sosGanador(retador1)
		duelo.sosPerdedor(retador2)
	}
}