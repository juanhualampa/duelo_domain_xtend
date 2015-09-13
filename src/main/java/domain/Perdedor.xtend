package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Perdedor implements Veredicto{
	
	override actualizarEstadisticas(Retador it) {
		estadisticas.agregarUnaParticipacion
		actualizacionesDependientesDeLaPosicion
	}
	
	def void actualizacionesDependientesDeLaPosicion(Retador it)
	 {
		println(inicio.toString())
		inicio.actualizarA(it)
	}
	
	override actualizaSegunGanesPierdasOEmpates(Retador ret) {
		
	}
	
}