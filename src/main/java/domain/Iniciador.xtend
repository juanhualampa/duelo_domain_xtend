package domain

class Iniciador extends Inicio{
	
	override actualizarA(Retador it) {
		estadisticas.ubicacionesUsadas.add(ubicacion)		
		actualiza()
		estadisticas.calificacion = new CalculadorDeCalificaciones().calcular(it)
	}
	
	override aString() {
		"Iniciador"
	}
	
	
	
}