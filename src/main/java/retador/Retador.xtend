package retador

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import duelos.Duelo
import java.util.Random
import calculadorDeCalificaciones.CalculadorDeCalificaciones

/**
 * Clase que agrupa un jugador, personaje y ubicacion para un duelo.
 */
@Accessors
@Observable
abstract class Retador {
	
	Jugador jugador	
	Personaje personaje
	Ubicacion ubicacion	
		
	new (){	}
	
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion) {
		this.jugador= jugador
		this.personaje = personaje
		this.ubicacion = ubicacion
	}
	
	def Integer poderDeAtaque(){
		jugador.poderDeAtaque(personaje)
	}
	
	def esMasPoderosoQue(Retador it){
		this.poderDeAtaque > it.poderDeAtaque
	}
	
	def estadisticas(Personaje personaje) {
		jugador.estadisticas(personaje)
	}
	
	def agregarDuelosAJugador(Duelo duelo){
		this.jugador.agregarDuelo(duelo)
	}
	
	def actualizarCalificacion(){
		val nroAlAzar = new Random().nextInt(100)
		estadisticas(personaje).calificacion = new CalculadorDeCalificaciones().calcular(this,nroAlAzar)
	}
	
	def void aplicarActualizacionAlGanar()
	
	def void aplicarActualizacionAlPerder()
	
	def void aplicarActualizacionAlEmpatar()
}