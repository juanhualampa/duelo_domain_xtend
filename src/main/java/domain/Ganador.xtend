package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ganador implements Veredicto{
		
	override actualizarEstadisticas(Retador it) {
		estadisticas.agregarUnaParticipacion
		estadisticas.agregarUnaVictoria
		actualizacionesDependientesDeLaPosicion
		println("Termine??")
	}
	
	def void actualizacionesDependientesDeLaPosicion(Retador it) {
		inicio.actualizarA(it)
	}
		
	override actualizaSegunGanesPierdasOEmpates(Retador it) {
		estadisticas.mejorUbicacion = ubicacion		
	}
}