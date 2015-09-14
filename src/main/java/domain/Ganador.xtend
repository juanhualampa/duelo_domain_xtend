package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador implements Veredicto{
	
	override actualizarEstadisticasSegunVeredicto(Retador it) {
		actualizarUsandoInicio(it,it.inicio)
	}
	
	def dispatch actualizarUsandoInicio(Retador it, Iniciador inicio) {
		estadisticas(it.personaje).agregarUnaVictoria
		estadisticas(it.personaje).mejorUbicacion = ubicacion
	}
	
	def dispatch actualizarUsandoInicio(Retador it, NoIniciador inicio) {
		estadisticas(personaje).sumarKill
	}
	
}