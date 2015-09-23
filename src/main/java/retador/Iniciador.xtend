package retador
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Jugador
import domain.Personaje
import domain.Ubicacion

@Accessors
class Iniciador extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje, ubicacion)
	}
	
	new() {
		super()
	}
		
}