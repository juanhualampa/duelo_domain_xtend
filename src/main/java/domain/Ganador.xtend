package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador extends Veredicto{
		
	Retador participante
	Duelo duelo
	
	new(Retador participante, Duelo duelo) {
		super(participante,duelo)
	}
	
	def actualizarEstadisticas(Personaje personaje) {
		personaje.estadistica.actualizar()
	}
		
	override actualizacionesDependientesDeLaPosicion(Retador retador) {
		print(retador.inicio.toString())
		retador.inicio.actualizarA(this)
	}	
		
	override actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion
		estadistica.agregarUnaVictoria
		this.participante.actualizacionesDependientesDeLaPosicion()		
	}
		
	
}