package domain

class NoIniciador implements Inicio{
	
	def dispatch actualiza(Ganador ganador) {
		ganador.estadisticas.sumarKill
	}
	
	def dispatch actualiza(Perdedor p){
		p.estadisticas.sumarDeads
	}
	
	override actualizarA(Veredicto veredicto) {
		actualiza(veredicto)
	}
	
	override aString() {
		"No-Iniciador"
	}
	
}