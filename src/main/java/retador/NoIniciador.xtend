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
	
	override aplicarActualizacionAlGanar() {
		actualizarse
		estadisticas(personaje).sumarKill	
		actualizarCalificacion
	}
	
	override aplicarActualizacionAlPerder() {
		estadisticas(personaje).sumarDeads
		actualizarCalificacion
	}
	
	override aplicarActualizacionAlEmpatar() {
		estadisticas(personaje).agregarAssist
	}
	
}