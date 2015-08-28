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
	
	new(String Nombre){
		personajes = new ArrayList<Personaje>()
		pesoDeDenuncias = 0
		cantDePeleasGanadas = 0
		denuncias = new ArrayList<Denuncia>()
		ranking = 0
	}
	def Integer getRanking(){
		ranking = this.calificacion() / 500
	}	
	
	
	def Integer calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
	}
			
	def promedioDeCalificacionesDePersonajes() {
		personajes.map[it.calificacion].reduce[uno, otro | uno + otro]
	}
}