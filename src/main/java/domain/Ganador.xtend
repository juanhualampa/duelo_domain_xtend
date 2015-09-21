package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Ganador extends Veredicto{
	
	new(Retador r1) {
		super(r1)
	}
	
	def dispatch actualizarse(Iniciador it) {
		paraInicializadores(it)
		estadisticas(personaje).agregarUnaVictoria
		estadisticas(personaje).mejorUbicacion = ubicacion		
		val nroAlAzar = new Random().nextInt(100)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(it,nroAlAzar)
	}
		
	def dispatch actualizarse(NoIniciador it) {
		estadisticas(personaje).sumarKill
		estadisticas(personaje).agregarUnaParticipacion	
	}
	
	def dispatch actualizarse(Bot inicio) {
	}
	
	
}