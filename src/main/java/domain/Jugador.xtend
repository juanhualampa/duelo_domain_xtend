package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.model.Entity
import duelos.Motivo
import duelos.Duelo

/**
 * Representa a un jugador del sistema. El mismo posee las estadisticas para cada personaje.
 */
@Accessors
@Observable
class Jugador extends Entity{
	String nombre
	List<EstadisticasPersonajes> estadisticasPersonajes	
	List<Denuncia> denuncias	
	List<Duelo> duelos	
	Juego juego
	
	new(String Nombre,Juego juego){
		estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		denuncias = newArrayList
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = Nombre;
		registrarEn(juego)
	}
	new(){}
	
	new(String nombre, List<EstadisticasPersonajes> estadisticasPersonajes){
		this.estadisticasPersonajes = estadisticasPersonajes
		denuncias = newArrayList
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = nombre
	}
	
	new(String nombre) {
		this.nombre = nombre
	}
		
	def void registrarEn(Juego sis){
		this.juego = sis
		this.juego.jugadores.add(this)
	}
		
	def recibioDenuncia(Denuncia denuncia) {
		denuncias.add(denuncia)
	}

	def Integer pesoDeDenuncias(){
		denuncias.fold(0)[a,b | a + b.unMotivo.peso]
	}
	
	def promedioDeCalificacionesDePersonajes() {
		estadisticasPersonajes.fold(0)[a,b| a + b.calificacion.nro]
	}
	
	def Integer getRanking(){
		this.calificacion() / 500
	}	
	
	def Duelo iniciarDuelo (Personaje personaje ,Ubicacion ubic){
		juego.iniciarReto(this, personaje, ubic)
	}
		
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) 
	}
			
	 def denunciarAJugador(Jugador jug, Motivo mot, Descripcion desc) {
	 	juego.denunciarJugador(obtenerUltimoDueloContra(jug), mot, desc)
	 }
	
	def Duelo obtenerUltimoDueloContra(Jugador jugador) {
		this.duelos.filter[it.involucraA(jugador)].last
	}
	
	def EstadisticasPersonajes estadisticas(Personaje p){
		estadisticasPersonajes.filter[it.personaje.equals(p)].head
	}
	
	def poderDeAtaque(Personaje personaje) {
		estadisticas(personaje).poderDeAtaque
	}
		
	def agregarEstadistica(EstadisticasPersonajes it) {
		estadisticasPersonajes.add(it)
	}
	
	def agregarEstadisticaPara(Personaje it) {
		estadisticasPersonajes.add(new EstadisticasPersonajes(it))
	}
		
}