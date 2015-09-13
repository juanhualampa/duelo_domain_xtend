package domain

class Iniciador extends Inicio{
	
	override actualizarEstadisticas(Retador it) {
		estadisticas.agregarUnaParticipacion
		estadisticas.ubicacionesUsadas.add(ubicacion)		
		it.veredicto.actualizarEstadisticasSegunVeredicto(it)
		estadisticas.calificacion = new CalculadorDeCalificaciones().calcular(it)
	}
	
	
	override aString() {
		"Iniciador"
	}
	
	
	
}