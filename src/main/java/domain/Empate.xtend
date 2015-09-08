package domain

class Empate {
	
	new(Duelo duelo) {
		duelo.retador.personaje.estadistica.actualizar()
		duelo.retado.personaje.estadistica.actualizar()
	}
	
	def void actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion	
		estadistica.agregarAssist	
	}
	
}