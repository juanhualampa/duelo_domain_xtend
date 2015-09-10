package domain

import org.uqbar.commons.utils.Observable

/**
 * el contrincante es ampliamente superior en todos los aspectos y no hay chances de ganarle
 */
@Observable
class AbusoDeHabilidad extends Motivo{
	
	new(){
		super("Abuso de Habilidad")
	}
	override peso() {
		5
	}	
	
}