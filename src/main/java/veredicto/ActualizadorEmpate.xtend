package veredicto

import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import retador.Bot

class ActualizadorEmpate extends ActualizadorDeStats{
		
	def dispatch actualizarse(Iniciador it) {
		estadisticas(it.personaje).agregarAssist
	}
	
	def dispatch actualizarse(NoIniciador it) {
		estadisticas(it.personaje).agregarAssist
	}
	
	def dispatch actualizarse(Bot it) {
	}
	
	
}