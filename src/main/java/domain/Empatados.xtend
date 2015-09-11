package domain

class Empatados extends Resultado {
	
	new(Retador ret1, Retador ret2) {
		super(ret1,ret2)
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo duelo) {
		duelo.empataste(retador1)
		duelo.empataste(retador2)
	}
	
}