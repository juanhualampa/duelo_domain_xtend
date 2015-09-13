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
	
	def Integer poderDeAtaque(){
		personaje.poderDeAtaque()
	}
	
	def esMasPoderosoQue(Retador it){
		this.poderDeAtaque > it.poderDeAtaque
	}
	
//	def void pelea(Retador it,Duelo duelo) {
//		if(esMasPoderosoQue){
//			println("Entre por mas poderoso")
//			duelo.resultado = new Victoria(this,it)
//			duelo.actualizarEstadisticas()
//			agregarDuelo(duelo)
//		}
//		if(! esMasPoderosoQue){
//			println("Entre por menos poderoso")
//			duelo.resultado = new Derrota(it,this)
//			duelo.actualizarEstadisticas()
//			agregarDuelo(duelo)
//		}
//		else{
//			println("Entre por empatados")
//			duelo.resultado = new Empatados(this,it)
//			agregarDuelo(duelo)
//		}
//	}
	
	def estadisticas(){
		this.personaje.estadistica
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