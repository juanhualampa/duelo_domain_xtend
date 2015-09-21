package domain
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Iniciador extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje, ubicacion)
	}
	
	new() {
		super()
	}
		
//		
//	override aString() {
//		"Iniciador"
//	}
	
	
	
}