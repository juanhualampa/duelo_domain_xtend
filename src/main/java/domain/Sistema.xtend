package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Sistema {
	List<Jugador> jugadores = newArrayList	
	Retador oponentePorDefecto
	
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def void iniciarReto(Jugador it, Personaje per ,Ubicacion ubic){
		armarDuelo(new Retador(it,per,ubic,new Iniciador))
	}
	
	def noPoseeEstadisticas(Jugador it, Personaje personaje) {
		! estadisticasPersonajes.exists[it.personaje.equals(personaje)]
	}
	
	def armarDuelo(Retador ret){
		if(ret.noHayOponente){
			// a joderse
		}
		else{
			realizarDuelo(ret,ret.obtenerOponente)
		}
	}
		
	def Retador obtenerOponente(Retador it){
		val contrincante = oponentesPosibles.head
		new Retador(contrincante,contrincante.elegirPersonajeAlAzar,Ubicacion.BOTTOM, new NoIniciador)
	}
	
	def elegirPersonajeAlAzar(Jugador jugador) {
		jugador.estadisticasPersonajes.get(0).personaje
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

	def denunciarJugador(Denuncia den) {
		den.castigar
	}
	
}