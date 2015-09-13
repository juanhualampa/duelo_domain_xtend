package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Retador {
	
	Jugador jugador	
	Personaje personaje
	Ubicacion ubicacion	
	Inicio inicio
	Veredicto veredicto
		
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion, Inicio inicio) {
		this.jugador= jugador
		this.personaje = personaje
		this.ubicacion = ubicacion
		this.inicio = inicio
	}
	
	def Integer poderDeAtaque(Retador it){
		personaje.poderDeAtaque()
	}
	
	def esMasPoderosoQue(Retador it){
		poderDeAtaque(this) > poderDeAtaque
	}
	
	def void pelea(Retador it,Duelo duelo) {
		if(esMasPoderosoQue){
			println("Entre por mas poderoso")
			duelo.resultado = new Victoria(this,it)
			duelo.actualizarEstadisticas()
			agregarDuelo(duelo)
		}
		if(! esMasPoderosoQue){
			println("Entre por menos poderoso")
			duelo.resultado = new Derrota(it,this)
			duelo.actualizarEstadisticas()
			agregarDuelo(duelo)
		}
		else{
			duelo.resultado = new Empatados(this,it)
			agregarDuelo(duelo)
		}
	}
	
	def estadisticas(){
		this.personaje.estadistica
	}
	
	def agregarDuelo(Retador it, Duelo duelo) {
		jugador.duelos.add(duelo)
		duelos.add(duelo)
	}
	
	def duelos (Retador it){
		jugador.duelos
	}
	
	def Veredicto setPostDuelo(Veredicto v) {
		this.veredicto = v
	}
		
	def actualizarEstadisticasDelRetador() {
		inicio.actualizarEstadisticas(this)
	}
		
//	def actualizarEstadisticasComoGanadorEIniciador() {
//		estadisticas.agregarUnaVictoria
//		estadisticas.ubicacionesUsadas.add(ubicacion)
//	}
	
}