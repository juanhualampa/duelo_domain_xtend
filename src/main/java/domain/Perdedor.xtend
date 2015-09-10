package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Perdedor extends Veredicto{
	
	Retador participante
	Duelo duelo
	
	new(Retador participante, Duelo duelo) {
		this.participante = participante
		this.duelo = duelo
		actualizarEstadisticas()
	}
	
	def estadisticas(){
		this.participante.personaje.estadistica
	}
	
	def actualizarEstadisticas() {
		estadisticas.actualizar()
	}
	
	def void actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion
		this.participante.actualizacionesDependientesDeLaPosicion()		
	}
	
	def actualizacionesDependientesDeLaPosicion(Retador retador) {
		retador.inicio.actualizarA(this)
	}	
}