package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EstadisticaJugadorPersonaje {
	
	Jugador jugador	
	Personaje personaje	
	Integer vecesUsadoAntesDelDuelo
	Integer vecesQueGanoDuelo	
	Integer vecesKills
	Integer vecesDeads
	Integer vecesAssist	
	Ubicacion ubicacionesUsadas	
	Integer calificacion
	
	Object desempenio
	
	new(Jugador jugador, Personaje personaje){
		this.jugador = jugador
		this.personaje = personaje
		this.vecesUsadoAntesDelDuelo = 0
		this.vecesKills = 0
		this.vecesDeads = 0
		this.vecesAssist = 0
		this.ubicacionesUsadas = new Ubicacion()
		this.calificacion = 0
		this.desempenio = new Desempenio()
	}
	
	def experiencia(){
		
	}
	
	def desempeño(){
		
	}
}