package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Derrota extends Resultado{
	
	Ganador ganador
	Perdedor perdedor
	
	new(Ganador ganador, Perdedor perdedor) {
		this.ganador = ganador
		this.perdedor = perdedor
	}
	
	def nombreGanador(){
		ganador.participante.jugador.nombre
	}
	
	def nombrePerdedor(){
		perdedor.participante.jugador.nombre
	}
	
}