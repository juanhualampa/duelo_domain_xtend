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
			
		
	override aplicarActualizacionAlGanar(Duelo duelo) {
		println("LLEGUE A ACTUALIZAR")
		agregarDuelosAJugador(duelo)
		estadisticas(personaje).agregarUnaParticipacion
		//estadisticas(personaje).ubicacionesUsadas.add(ubicacion)
		estadisticas(personaje).agregarUnaVictoria
		estadisticas(personaje).mejorUbicacion = ubicacion		
		val nroAlAzar = new Random().nextInt(100)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(this,nroAlAzar)
	}
	
	override aplicarActualizacionAlPerder(Duelo duelo) {
		estadisticas(personaje).agregarUnaParticipacion
		agregarDuelosAJugador(duelo)
	}
	
	override aplicarActualizacionAlEmpatar(Duelo duelo) {
		agregarDuelosAJugador(duelo)
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).agregarAssist
	}
	
		
}