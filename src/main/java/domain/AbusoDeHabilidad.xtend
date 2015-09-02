package domain

/**
 * el contrincante es ampliamente superior en todos los aspectos y no hay chances de ganarle
 */
class AbusoDeHabilidad extends Motivo{
	
	override peso() {
		5
	}
	
	override aplicarPenalidadContraSiCorresponde(Retador retador, Retador retado) {
		if (8>0)//(retador.personajeretado.personaje) //comparacion habilidad
			retador.jugador.pesoDeDenuncias = retador.jugador.pesoDeDenuncias + peso
	}
	
	
}