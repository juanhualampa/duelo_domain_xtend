package appModels

import domain.Duelo
import domain.EstadisticasPersonajes
import org.uqbar.commons.utils.Observable
import domain.Jugador
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Victoria
import domain.Derrota
import domain.Empatados
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class DueloAppModel {	
	
	Duelo duelo	
	String copete = ""	
	String title = ""	
	String msj = ""
	
	new(Duelo duelo) {
		this.duelo = duelo
		this.resultadoDuelo
	}
	
	def Jugador getJugadorRetador(){
		this.duelo.retador.jugador
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
	
	def resultadoDuelo(){
		duelo.resultado.display
	}
	
	def setTitle(String t){
		title = t
		ObservableUtils.firePropertyChanged(this,"title")
	}
	
	def setCopete(String c){
		copete = c
		ObservableUtils.firePropertyChanged(this,"copete")
	}
	def setMsj(String m){
		msj = m
		ObservableUtils.firePropertyChanged(this,"msj")
	}
	
	def dispatch display(Victoria resultado){
		title = "Ganaste contra "+ nombreRetado
		copete = "Ganador: " + nombreRetador +"! "+ this.duelo.retador.poderDeAtaque + " puntos contra "
		+ this.duelo.retado.poderDeAtaque
		msj = "Celebra tu victoria"
	}
	
	def dispatch display(Empatados resultado){
		title = "Empataste contra "+ nombreRetado
		copete = "Empataste: " + nombreRetador +" "+  this.duelo.retador.poderDeAtaque + " puntos contra "
		+ this.duelo.retado.poderDeAtaque
		msj = "Mediocre, mejora !"
	}
	def dispatch display(Derrota resultado){
		title = "Perdiste contra "+ nombreRetado 
		copete = "Ganador: " + nombreRetado +"! "+ this.duelo.retado.poderDeAtaque + " puntos contra "
		+ this.duelo.retador.poderDeAtaque
		msj = "Aceptar Derrota con Honor"
	}
	
	def personajeRetador() {
		this.duelo.retador.personaje.nombre
	}
	
	def personajeRetado() {
		this.duelo.retado.personaje.nombre
	}
	
}