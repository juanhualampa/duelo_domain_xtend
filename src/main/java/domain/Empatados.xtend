package domain

class Empatados extends Resultado {
		
	override aplicarActualizacionesAEstadisticas(Duelo it, Retador ret1, Retador ret2) {
		empataste(ret1)
		empataste(ret2)
	}
	override visualizacion() {
		"Empataro con «nombrePerdedor», son igual de malos " //falta el tema de los puntos
	}
	
}