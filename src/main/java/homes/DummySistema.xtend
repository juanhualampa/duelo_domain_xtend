package homes

import org.uqbar.commons.utils.ApplicationContext
import domain.Jugador
import domain.Juego

class DummySistema {
	
	Juego sis
	
	new(){
		sis = new Juego()
		sis.jugadores.add(this.getJugadores("La Tota"))		
	}
	
	def Jugador jugadorPrincipal(){
		sis.jugadores.get(0)
	}
	
	def getJugadores(String nombre) {
		(ApplicationContext.instance.getSingleton(typeof(Jugador)) as HomeJugadores).get(nombre)
	}
	
	
}