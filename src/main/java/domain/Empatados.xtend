package domain

class Empatados extends Resultado {
	
	new(Retador retador, Retador retador2) {
		this.retador1 = retador
		this.retador2 = retador2
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		retador.aplicarVeredicto(new Empate)
		retado.aplicarVeredicto(new Empate)
	}
}