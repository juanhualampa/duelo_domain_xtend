package domain

class Iniciador implements Inicio{
	
	def dispatch actualiza(Ganador ganador) {
		ganador.estadisticas.ubicacionesUsadas.add(ganador.participante.ubicacion)
		ganador.estadisticas.mejorUbicacion = ganador.participante.ubicacion
		ganador.estadisticas.calificacion = null
		/*
		 * Falta saber como dar calificacion al Ganador.
		 */
	}
	
	def dispatch actualiza(Perdedor p){
		p.estadisticas.ubicacionesUsadas.add(null)
		p.estadisticas.calificacion = null
	}
	
	override actualizarA(Veredicto veredicto) {
		actualiza(veredicto)
	}
	
}