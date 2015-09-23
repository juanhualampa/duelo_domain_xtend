package duelos

import org.uqbar.commons.utils.Observable

/**
 * El contrincante abusa y tiene malos tratos con nosotros
 */
 @Observable
class ComunicacionAbusiva extends Motivo{
	
	new() {
		super("Comunicacion abusiva")
	}
	
	override peso() {
		7
	}	
	
}