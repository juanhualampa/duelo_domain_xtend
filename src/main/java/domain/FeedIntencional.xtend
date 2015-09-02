package domain
/**
 * el contrincante se esta dejando ganar y no presenta ningun desafio	
 */
class FeedIntencional extends Motivo{
	
	override peso() {
		10
	}
	
	override aplicarPenalidadContraSiCorresponde(Retador retador, Retador retado) {
	// Es al reves del abuso de habilidad
	}
	
	
	
}