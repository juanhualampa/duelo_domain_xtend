package domain

class Iniciador extends Inicio{
	
	override actualizarEstadisticas(Retador it) {
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).ubicacionesUsadas.add(ubicacion)		
		veredicto.actualizarEstadisticasSegunVeredicto(it)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(it)
	}
		
	override aString() {
		"Iniciador"
	}
	
	
	
}