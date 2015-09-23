package duelos

import org.uqbar.commons.utils.Observable

/**
 * el contrincante se esta dejando ganar y no presenta ningun desafio	
 */
@Observable
class FeedIntencional extends Motivo{
	
	new() {
		super("Feed Intencional")
	}
	
	override peso() {
		10
	}
		
	
	
}