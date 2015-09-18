package appModels

import domain.Duelo
import domain.EstadisticasPersonajes
import org.uqbar.commons.utils.Observable
import domain.Retador
import domain.Jugador
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class DueloAppModel {	
	Duelo duelo
	
	new(Duelo duelo) {
		this.duelo = duelo
		
	}
	
	def Jugador getJugadorRetador(){
		this.duelo.retador.jugador
	}
	
	def getNombreRetador(Duelo duelo) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def String getNombreRetado() {
		this.duelo.retado.jugador.nombre
	}
	
	def String getNombreRetador() {
		this.duelo.retador.jugador.nombre
	}
	
	def EstadisticasPersonajes getEstadisticasRetado(){
		this.duelo.retado.jugador.estadisticas(this.duelo.retado.personaje)
	}
	
	def EstadisticasPersonajes getEstadisticasRetador(){
		this.duelo.retador.jugador.estadisticas(this.duelo.retador.personaje)
	}
	
	def String visualizateParteSuperior() {
		this.duelo.resultado.visualizacionParteSuperior
	}
	
	def String visualizateParteInferior() {
		this.duelo.resultado.visualizacionInferior
	}
	
}