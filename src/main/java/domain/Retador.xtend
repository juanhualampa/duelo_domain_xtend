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
		
	new(Jugador jugador, Personaje personaje, Ubicacion ubicacion, Inicio inicio) {
		this.jugador= jugador
		this.personaje = personaje
		this.ubicacion = ubicacion
		this.inicio = inicio
	}
	
	def Integer poderDeAtaque(Retador ret){
		ret.personaje.poderDeAtaque()
	}
	
	def esMasPoderosoQue(Retador ret){
		poderDeAtaque(this) > poderDeAtaque(ret)
	}
	
	def void pelea(Retador retador,Duelo duelo) {
		if(esMasPoderosoQue(retador)){
			duelo.resultado = new Victoria(this,retador)
			duelo.actualizarEstadisticas()
			agregarDuelo(retador,duelo)
		}
		if(!(esMasPoderosoQue(retador))){
			duelo.resultado = new Derrota(retador,this)
			duelo.actualizarEstadisticas()
			agregarDuelo(retador,duelo)
		}
		else{
			duelo.resultado = new Empatados(this,retador)
			agregarDuelo(retador,duelo)
		}
	}
	
	def agregarDuelo(Retador retador, Duelo duelo) {
		jugador.duelos.add(duelo)
		retador.duelos.add(duelo)
	}
	
	def duelos (Retador ret){
		ret.jugador.duelos
	}
		
	
	
}