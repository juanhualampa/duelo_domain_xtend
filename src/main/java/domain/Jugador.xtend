package domain

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import javax.management.Descriptor
import org.eclipse.xtext.xbase.lib.Functions.Function1

@Accessors
class Jugador {
	ArrayList<Personaje> personajes	
	int cantDePeleasGanadas
	ArrayList<Denuncia> denuncias	
	Integer ranking
	String nombre
	ArrayList<Duelo> duelos
	
	new(String Nombre){
		personajes = newArrayList
		cantDePeleasGanadas = 0
		denuncias = newArrayList
		ranking = 0
		duelos = newArrayList
		denuncias = newArrayList
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
	
	
//	def <T,R> nose(List<T> lista, Function1<? super T, ? extends R> func){
//		lista.map[func]
//	}
	
	
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