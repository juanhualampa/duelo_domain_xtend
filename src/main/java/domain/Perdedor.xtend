package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Perdedor implements Veredicto{
	
	override actualizarEstadisticasSegunVeredicto(Retador it) {
		actualizarUsandoInicio(it,it.inicio)
	}
	
	def dispatch actualizarUsandoInicio(Retador it, Iniciador inicio) {
	}
	
	def dispatch actualizarUsandoInicio(Retador it, NoIniciador inicio) {
		estadisticas(personaje).sumarDeads
	}
	
}