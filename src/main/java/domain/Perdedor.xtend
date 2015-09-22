package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Perdedor extends Veredicto{
	
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