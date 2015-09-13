package domain

class Empatados extends Resultado {
	
	new(Retador ret1, Retador ret2) {
		super(ret1,ret2)
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		empataste(retador1)
		empataste(retador2)
	}
	override visualizacion() {
		"Empataro con «nombrePerdedor», son igual de malos " //falta el tema de los puntos
	}
	
}