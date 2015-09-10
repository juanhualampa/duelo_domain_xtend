package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador extends Veredicto{
		
	Retador participante
	Duelo duelo
	
	new(Retador ganador, Duelo duelo) {
		this.participante = ganador
		this.duelo = duelo
		this.participante.personaje.actualizarEstadisticas()
	}
	
	def actualizarEstadisticas(Personaje personaje) {
		personaje.estadistica.actualizar()
	}
		
	def void actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion
		estadistica.agregarUnaVictoria
		this.participante.actualizacionesDependientesDeLaPosicion()		
	}
	
	def estadisticas(){
		this.participante.personaje.estadistica
	}
	
	def actualizacionesDependientesDeLaPosicion(Retador retador) {
		retador.inicio.actualizarA(this)
	}
		
	def mensaje(){
		"Ganaste contra «duelo.retado.nombre»"
	}
	
}