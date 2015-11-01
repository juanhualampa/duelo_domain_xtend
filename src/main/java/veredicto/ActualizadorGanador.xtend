package veredicto

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import retador.Bot
import retador.Iniciador
import retador.NoIniciador

@Accessors
class ActualizadorGanador extends ActualizadorDeStats{
		
	def dispatch actualizarse(Iniciador it) {
		paraInicializadores()
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