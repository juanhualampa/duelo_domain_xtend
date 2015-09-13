package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Jugador {
	List<Personaje> personajes	
	int cantDePeleasGanadas
	List<Denuncia> denuncias	
	Integer ranking
	String nombre
	List<Duelo> duelos	
	Sistema sistema
	
	new(String Nombre,Sistema sis){
		personajes = new ArrayList<Personaje>()
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = Nombre;
		this.sistema = sis
		sistema.jugadores.add(this)
	}
	
	def recibioDenuncia(Denuncia denuncia) {
		denuncias.add(denuncia)
	}

	def Integer pesoDeDenuncias(){
		denuncias.fold(0)[a,b | a + b.unMotivo.peso]
	}
	
	def promedioDeCalificacionesDePersonajes() {
		personajes.fold(0)[a,b| a + b.estadistica.calificacion.nro]
	}
	
	def Integer getRanking(){
		ranking = this.calificacion() / 500
	}	
	
	def iniciarDuelo (Personaje personaje ,Ubicacion ubic){
		sistema.iniciarReto(this, personaje, ubic)
	}
			
	def elegirPersonajeAlAzar(){
		this.personajes.get(0) // deberia  ser random
	}
	
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
		// aunque nos piden 		pesoDeDenuncias  * cantDePeleasGanadas
	}
			
	 def denunciarAJugador(Jugador jug, Motivo mot, Descripcion desc) {
	 	sistema.denunciarJugador(new Denuncia(obtenerUltimoDueloContra(jug), mot, desc))
	 }
	
	def Duelo obtenerUltimoDueloContra(Jugador jugador) {
		this.duelos.filter[it.involucraA(jugador)].last
	}
		
}