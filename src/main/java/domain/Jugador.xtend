package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Jugador {
	List<EstadisticasPersonajes> estadisticasPersonajes	
	int cantDePeleasGanadas
	List<Denuncia> denuncias	
	Integer ranking
	String nombre
	List<Duelo> duelos	
	Sistema sistema
	
	new(String Nombre,Sistema sis){
		estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>()
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = Nombre;
		this.sistema = sis
		sistema.jugadores.add(this)
	}
	
	new(String nombre, List<EstadisticasPersonajes> estadisticasPersonajes){
		this.estadisticasPersonajes = estadisticasPersonajes
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = nombre
	}
	
	def setSistema(Sistema sis){
		this.sistema = sis
		this.sistema.jugadores.add(this)
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
		ranking = this.calificacion() / 500
	}	
	
	def Duelo iniciarDuelo (Personaje personaje ,Ubicacion ubic){
		sistema.iniciarReto(this, personaje, ubic)
	}
		
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
		// aunque nos piden 		pesoDeDenuncias  * cantDePeleasGanadas
	}
			
	 def denunciarAJugador(Jugador jug, Motivo mot, Descripcion desc) {
	 	sistema.denunciarJugador(obtenerUltimoDueloContra(jug), mot, desc)
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