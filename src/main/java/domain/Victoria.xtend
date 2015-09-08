package domain

class Victoria extends Resultado{
	
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