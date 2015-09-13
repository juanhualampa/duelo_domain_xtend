package domain

class Empatados extends Resultado {
	
	new(Retador retador, Retador retador2) {
		this.retador1 = retador
		this.retador2 = retador2
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		empataste(this.retador1)
		empataste(this.retador2)
	}
	override visualizacion() {
		"Empataro con «nombrePerdedor», son igual de malos " //falta el tema de los puntos
	}
	
}