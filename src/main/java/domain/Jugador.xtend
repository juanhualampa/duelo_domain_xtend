package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	ArrayList<Personaje> personajes	
	int pesoDeDenuncias	
	int cantDePeleasGanadas
	ArrayList<Denuncia> denuncias	
	
	new(String Nombre){
		personajes = newArrayList
		pesoDeDenuncias = 0
		cantDePeleasGanadas = 0
		denuncias = newArrayList
	}
	
	def calificacion(){
		(promedioDeCalificacionesDePersonajes - pesoDeDenuncias ) * cantDePeleasGanadas
	}
			
	def promedioDeCalificacionesDePersonajes() {
		personajes.map[it.calificacion].reduce[uno, otro | uno + otro]
	}
}