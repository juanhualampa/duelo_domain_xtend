package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador {
		
	Retador participante
	
	new(Retador ganador, Ubicacion ubicacion, Duelo duelo) {
		this.participante = ganador
		this.participante.personaje.actualizarEstadisticas(ubicacion,duelo)
	}
	
	def actualizarEstadisticas(Personaje personaje, Ubicacion ubicacion,Duelo duelo) {
		personaje.estadistica.actualizar(ubicacion,duelo)
	}
	
	def void actualizar(EstadisticasPersonajes estadistica, Ubicacion ubicacion, Duelo duelo) {
		estadistica.agregarUnaParticipacion
		estadistica.agregarUnaVictoria
		this.participante.actualizacionesDependientesDeLaPosicion(duelo,ubicacion)		
	}
	
	def boolean inicioElDuelo(Duelo duelo){
		this.participante.jugador.equals(duelo.retador.jugador)
	}
	
	def estadisticas(){
		this.participante.personaje.estadistica
	}
	
	def actualizacionesDependientesDeLaPosicion(Retador retador, Duelo duelo, Ubicacion ubi) {
				
		if(inicioElDuelo(duelo)){			
			estadisticas.ubicacionesUsadas.add(null)
			estadisticas.mejorUbicacion = ubi
			estadisticas.calificacion = null
			/*
			 * Tengo que recalcular esto, necesitaria encapsular en el duelo los datos del retador: jugador
			 * personaje y ubicacion
			 */
		}
		else{
			estadisticas.sumarKill
		}
	}
	
	
	/*
	 *     
	
	Cantidad de veces que lo usó para iniciar un duelo

    Cantidad de veces que ganó un duelo

    Cantidad de kills: cantidad de duelos que ganó que no fueron iniciados por él

    Cantidad de deads: cantidad de duelos que perdió que no fueron iniciados por él

    Assists: cantidad de duelos que empató (independientemente si los inició o no el jugador)

    Ubicaciones usadas: de los duelos iniciados por el jugador

    Mejor ubicación: ubicación con la que obtuvo la última victoria de duelos iniciados por el jugador

    Calificación: última calificación obtenida por el personaje en un duelo iniciado por el jugador
	 
	 */
	
	def mensaje(){
		"Ganaste contra «duelo.retado.nombre»"
	}
	
}