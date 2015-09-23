package veredicto

import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import retador.Bot

class Empate extends Veredicto{
		
	new(Retador r1) {
		super(r1)
	}
	
	def dispatch actualizarse(Iniciador it) {
		estadisticas(it.personaje).agregarAssist
	}
	
	def dispatch actualizarse(NoIniciador it) {
		estadisticas(it.personaje).agregarAssist
	}
	
	def dispatch actualizarse(Bot it) {
	}
	
	
}