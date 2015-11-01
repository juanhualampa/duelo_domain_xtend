package retador

import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import duelos.Duelo

class NoIniciador extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje,ubicacion)
	}
	
	def actualizarse() {
		estadisticas(personaje).agregarAssist
	}
	
	override aplicarActualizacionAlGanar(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		actualizarse
		estadisticas(personaje).sumarKill
		estadisticas(personaje).agregarUnaParticipacion	
	}
	
	override aplicarActualizacionAlPerder(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		estadisticas(personaje).sumarDeads
	}
	
	override aplicarActualizacionAlEmpatar(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		estadisticas(personaje).agregarAssist
	}
	
}