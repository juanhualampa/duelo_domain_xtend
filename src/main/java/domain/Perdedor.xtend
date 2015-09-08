package domain

class Perdedor {
	
	Retador participante
	
	new(Retador participante, Ubicacion ubicacion, Duelo duelo) {
		this.participante = participante
		actualizarEstadisticas(ubicacion,duelo)
	}
	
	def estadisticas(){
		this.participante.personaje.estadistica
	}
	
	def actualizarEstadisticas(Ubicacion ubicacion,Duelo duelo) {
		estadisticas.actualizar(ubicacion,duelo)
	}
	
	def void actualizar(EstadisticasPersonajes estadistica, Ubicacion ubicacion, Duelo duelo) {
		estadistica.agregarUnaParticipacion
		this.participante.actualizacionesDependientesDeLaPosicion(duelo,ubicacion)		
	}
		
	def boolean inicioElDuelo(Duelo duelo){
		this.participante.jugador.equals(duelo.retador.jugador)
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
	
	def actualizacionesDependientesDeLaPosicion(Retador retador, Duelo duelo, Ubicacion ubi) {
				
		if(inicioElDuelo(duelo)){			
			estadisticas.ubicacionesUsadas.add(null)
			estadisticas.calificacion = null
			/*
			 * Tengo que recalcular esto, necesitaria encapsular en el duelo los datos del retador: jugador
			 * personaje y ubicacion
			 */
		}
		else{
			estadisticas.sumarDeads
		}
	}	
}