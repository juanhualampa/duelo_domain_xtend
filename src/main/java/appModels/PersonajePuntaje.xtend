package appModels

import domain.Personaje
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class PersonajePuntaje {
	
	Personaje personaje	
	String puntaje
	
	new(Personaje personaje, String puntaje) {
		this.personaje = personaje
		this.puntaje = puntaje
	}

}