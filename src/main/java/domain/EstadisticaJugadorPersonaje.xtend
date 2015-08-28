package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

/**
 * Modela la experiencia de un jugador con un personaje a medida que el juego se va utilizando
 */
@Accessors
class EstadisticaJugadorPersonaje {
	
	Jugador jugador	
	Personaje personaje	
	Integer vecesUsadoAntesDelDuelo
	Integer vecesQueGanoDuelo	
	Integer vecesKills
	Integer vecesDeads
	Integer vecesAssist	
	List<Ubicacion> ubicacionesUsadas	
	Integer calificacion
	
	Desempenio desempenio
	
	new(Jugador jugador, Personaje personaje){
		this.jugador = jugador
		this.personaje = personaje
		this.vecesUsadoAntesDelDuelo = 0
		this.vecesKills = 0
		this.vecesDeads = 0
		this.vecesAssist = 0
		this.ubicacionesUsadas = newArrayList
		this.calificacion = 0
		this.desempenio = new Desempenio()
	}
	
	
	def experiencia(){
		
	}
	
	def desempenio(){
		
	}
}