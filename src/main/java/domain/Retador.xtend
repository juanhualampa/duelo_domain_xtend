package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

/**
 * Clase que agrupa un jugador, personaje y ubicacion para un duelo.
 */
@Accessors
@Observable
abstract class Retador {
	
	Jugador jugador	
	Personaje personaje
	Ubicacion ubicacion	
		
	new (){	}
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		this.jugador= jugador
		this.personaje = personaje
		this.ubicacion = ubicacion
	}
	
	def Integer poderDeAtaque(){
		jugador.poderDeAtaque(personaje)
	}
	
	def esMasPoderosoQue(Retador it){
		this.poderDeAtaque > it.poderDeAtaque
	}
	
	def estadisticas(Personaje it) {
		jugador.estadisticas(it)
	}
	
}