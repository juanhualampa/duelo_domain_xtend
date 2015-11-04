package retador
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import java.util.Random
import duelos.Duelo
import calculadorDeCalificaciones.CalculadorDeCalificaciones

@Accessors
class Iniciador extends Retador{
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		super(jugador,personaje, ubicacion)
	}
	
	new() {
		super()
	}			
		
	override aplicarActualizacionAlGanar() {
		estadisticas(personaje).agregarUnaParticipacion
		//estadisticas(personaje).agregarUbicacion(this.ubicacion)
		estadisticas(personaje).agregarUnaVictoria
		estadisticas(personaje).mejorUbicacion = ubicacion		
		actualizarCalificacion
	}
	
	override aplicarActualizacionAlPerder() {
		estadisticas(personaje).agregarUnaParticipacion
		actualizarCalificacion
	}
	
	override aplicarActualizacionAlEmpatar() {
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).agregarAssist
		actualizarCalificacion
	}
	
		
}