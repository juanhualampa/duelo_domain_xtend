package domain

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Bot extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje,ubicacion)
	}
	
}