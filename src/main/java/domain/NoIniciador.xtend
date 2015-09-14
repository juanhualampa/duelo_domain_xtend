package domain

class NoIniciador extends Inicio{
	
	override actualizarEstadisticas(Retador it) {
		estadisticas(personaje).agregarUnaParticipacion		
		it.veredicto.actualizarEstadisticasSegunVeredicto(it)
	}
		
	override aString() {
		"No-Iniciador"
	}
	
	
}