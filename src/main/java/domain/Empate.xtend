package domain

class Empate extends Veredicto{
	
	
	new(Retador ret1, Duelo duelo) {
		super(ret1,duelo)
	}
	
	override actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion	
		estadistica.agregarAssist	
	}
	
}