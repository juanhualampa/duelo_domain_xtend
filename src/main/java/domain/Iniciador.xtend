package domain

class Iniciador implements Inicio{
	
	def dispatch actualiza(Ganador ganador) {
		ganador.estadisticas.mejorUbicacion = ganador.participante.ubicacion
	}
	
	def dispatch actualiza(Perdedor p){
	}
	
	override actualizarA(Veredicto veredicto) {
		veredicto.estadisticas.ubicacionesUsadas.add(veredicto.participante.ubicacion)
		actualiza(veredicto)
		veredicto.estadisticas.calificacion = new CalculadorDeCalificaciones().calcular(veredicto)
	}
	
}