package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Retador {
	
	Jugador jugador	
	Personaje personaje
	Ubicacion ubicacion
	
	new(Jugador jugador , Personaje personaje, Ubicacion ubicacion){
		this.jugador= jugador
		this.personaje = personaje
		this.ubicacion = ubicacion
	}
	
}