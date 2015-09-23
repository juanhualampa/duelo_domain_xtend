package veredicto

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import retador.Bot

@Accessors
class ActualizadorGanador extends ActualizadorDeStats{
		
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