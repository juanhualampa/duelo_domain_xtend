package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	ArrayList<Personaje> personajes	
	int pesoDeDenuncias	
	int cantDePeleasGanadas
	ArrayList<Denuncia> denuncias	
	Integer ranking
	String nombre
	
	new(String Nombre){
		personajes = newArrayList
		pesoDeDenuncias = 0
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
	}

	def Integer getRanking(){
		ranking = this.calificacion() / 500
	}	
	
	def Personaje personajeSeleccionado(){
		personajes.get(0) // Esto seria un fire property changes
	}
	
	def iniciarDuelo ( Sistema sist, Ubicacion ubi)
	{
		
	}
		
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
	}
			
	def promedioDeCalificacionesDePersonajes() {
		personajes.map[it.calificacion].reduce[uno, otro | uno + otro]
	}
}