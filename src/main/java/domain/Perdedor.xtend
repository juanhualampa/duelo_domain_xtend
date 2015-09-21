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
		
	
//	def dispatch actualizarUsandoInicio(NoIniciador ret) {
//		estadisticas(personaje).sumarDeads
//	}
//	
//	def dispatch actualizarUsandoInicio(Bot ret) {
//		estadisticas(personaje).sumarDeads
//	}
	
	
}