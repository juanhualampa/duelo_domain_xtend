package veredicto

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Iniciador
import retador.Retador
import retador.NoIniciador
import retador.Bot

@Accessors
class ActualizadorPerdedor extends ActualizadorDeStats{
	
	new(Retador retador) {
		super(retador)
	}
	
	def dispatch actualizarse(Iniciador it) {	
		paraInicializadores(it)	
	}
		
	def dispatch actualizarse(NoIniciador it) {
		estadisticas(personaje).sumarDeads
	}
	
	def dispatch actualizarse(Bot inicio) {
	}
	
}