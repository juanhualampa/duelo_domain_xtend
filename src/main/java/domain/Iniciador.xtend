package domain
import java.util.Random

class Iniciador extends Inicio{
	
	override actualizarEstadisticas(Retador it) {
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).ubicacionesUsadas.add(ubicacion)		
		veredicto.actualizarEstadisticasSegunVeredicto(it)
		val nroAlAzar = new Random().nextInt(100)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(it,nroAlAzar)
	}
		
	override aString() {
		"Iniciador"
	}
	
	
	
}