package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Retador {
	
	Jugador jugador	
	Personaje personaje
	
	new(Jugador jugador , Personaje personaje){
		this.jugador= jugador
		this.personaje = personaje
		
	}
}