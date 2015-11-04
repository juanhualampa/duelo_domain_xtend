package retador

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import duelos.Duelo

@Accessors
@Observable
class Bot extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje,ubicacion)
	}
	
	override aplicarActualizacionAlGanar() {
	}
	
	override aplicarActualizacionAlPerder() {
	}
	
	override aplicarActualizacionAlEmpatar() {
	}
	
}