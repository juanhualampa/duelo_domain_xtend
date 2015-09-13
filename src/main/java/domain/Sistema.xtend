package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Sistema {
	List<Jugador> jugadores = newArrayList
	
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def iniciarReto(Jugador jug, Personaje it ,Ubicacion ubic){
		armarDuelo(new Retador(jug,it,ubic,new Iniciador))
	}
	def armarDuelo(Retador it){	
		if(it.noHayOponente){
			// a joderse
		}
		else{
			realizarDuelo(it,obtenerOponente)
		}
	}
	
	def Retador obtenerOponente(Retador it){
		val contrincante = oponentesPosibles.head
		new Retador(contrincante,contrincante.elegirPersonajeAlAzar,Ubicacion.BOTTOM, new NoIniciador)
	}
	
	def noHayOponente(Retador it){
		oponentesPosibles.isEmpty
	}
	
	def oponentesPosibles(Retador retador){
		jugadores.filter[it.mismoRankingSinSerElMismo(retador.jugador)].toList
	}	
	
	def mismoRankingSinSerElMismo(Jugador it, Jugador jug2){
		ranking.equals(jug2.ranking)  && nombre != jug2.nombre
	}	
		
	def void realizarDuelo(Retador it, Retador ret2){
		new Duelo(it,ret2).realizarse
	}

	def denunciarJugador(Denuncia it) {
		castigar
	}
	
}