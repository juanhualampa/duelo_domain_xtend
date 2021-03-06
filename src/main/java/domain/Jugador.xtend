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
	new(Integer id,String nombre, List<EstadisticasPersonajes> estadisticasPersonajes){
		this.id = id
		this.estadisticasPersonajes = estadisticasPersonajes
		denuncias = newArrayList
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = nombre
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
	
	def List<String> nombrePersonajes(){
		estadisticasPersonajes.map[it.personaje.nombre]
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
		this.duelos.findLast[it.involucraA(jugador)]
	}
	
	def EstadisticasPersonajes estadisticas(Integer nro){
		estadisticasPersonajes.findFirst[it.personaje.id.equals(nro)]
	}
	
	def EstadisticasPersonajes estadisticas(Personaje p){
		estadisticasPersonajes.findFirst[it.personaje.id.equals(p.id)]
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
	
	def void agregarDuelo(Duelo duelo){
		duelos.add(duelo)
	}
		
}