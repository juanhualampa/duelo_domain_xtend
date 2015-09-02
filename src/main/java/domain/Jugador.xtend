package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import javax.management.Descriptor
import java.util.Stack

@Accessors
class Jugador {
	ArrayList<Personaje> personajes	
	int pesoDeDenuncias	
	int cantDePeleasGanadas
	ArrayList<Denuncia> denuncias	
	Integer ranking
	String nombre
	ArrayList<EstadisticasPersonajes> estadisticas	
	ArrayList<Duelo> duelos
	
	new(String Nombre){
		personajes = newArrayList
		estadisticas = newArrayList
		pesoDeDenuncias = 0
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
	}

	def Integer getRanking(){
		ranking = this.calificacion() / 500
	}	
	
	def Personaje personajeSeleccionado(){
		personajes.get(0) // Esto seria un fire property changes
	}
	
	/**
	 * da la orden de iniciar un duelo
	 */
	def iniciarDuelo (Sistema sist, Ubicacion ubic){
		sist.iniciarReto(new Retador(this, personajeSeleccionado), ubic)
	}
		
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
	}
			
	def promedioDeCalificacionesDePersonajes() {
		personajes.map[it.calificacion].reduce[uno, otro | uno + otro]
	}
	
	/**
	 * denunciar a jugador
	 */
	 def denunciarAJugador(Sistema sist, Jugador jug, Motivo mot, Descripcion desc) {
	 	sist.denunciarJugador(new Denuncia(obtenerUltimoDueloContra(jug), mot, desc))
	 }
	
	def Duelo obtenerUltimoDueloContra(Jugador jugador) {
		this.duelos.get(this.duelos.lastIndexOf(jugador))
	}
	
}