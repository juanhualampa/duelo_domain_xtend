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
	
	new(String Nombre){
		personajes = new ArrayList<Personaje>()
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
		denuncias = newArrayList
		this.nombre = Nombre;
	}
	
	def recibioDenuncia(Denuncia denuncia) {
		denuncias.add(denuncia)
	}

	def Integer pesoDeDenuncias(){
		denuncias.fold(0)[a,b | a + b.unMotivo.peso]
	}
	
	def promedioDeCalificacionesDePersonajes() {
		personajes.fold(0)[a,b| a + b.calificacion]
	}
	
	def Integer getRanking(){
		ranking = this.calificacion() / 500
	}	
	
	def Personaje personajeSeleccionado(){
		personajes.get(0) // Esto seria un fire property changes
	}
	
	def iniciarDuelo (Sistema sist, Ubicacion ubic){
		sist.iniciarReto(new Retador(this, personajeSeleccionado, ubic, new Iniciador()))
	}
			
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
		// aunque nos piden 		pesoDeDenuncias  * cantDePeleasGanadas
	}
			
	 def denunciarAJugador(Sistema sist, Jugador jug, Motivo mot, Descripcion desc) {
	 	sist.denunciarJugador(new Denuncia(obtenerUltimoDueloContra(jug), mot, desc))
	 }
	
	def Duelo obtenerUltimoDueloContra(Jugador jugador) {
		this.duelos.get(this.duelos.lastIndexOf(jugador))
	}
		
}