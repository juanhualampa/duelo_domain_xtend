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
	override visualizacionParteSuperior() {
		"Empataron con "+this.retador2.jugador.nombre +" , son igual de malos " //falta el tema de los puntos
	}
	
	override visualizacionInferior() {
		"Empataron, obtuvieron " + 
		this.retador1.estadisticas(this.retador1.personaje).calificacion.nro + " puntos contra " +
		this.retador2.estadisticas(this.retador2.personaje).calificacion.nro
	}
	
}