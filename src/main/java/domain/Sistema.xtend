package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Sistema {
	List<Jugador> jugadores = newArrayList
	
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def iniciarReto(Retador retador){
		if(noHayOponente(retador)){
			// a joderse
		}
		else{
			realizarDuelo(retador,obtenerOponente(retador))
		}
	}
	
	def Retador obtenerOponente(Retador retador){
		val contrincante = oponentesPosibles(retador).head
		new Retador(contrincante,contrincante.elegirPersonajeAlAzar,Ubicacion.BOTTOM, new NoIniciador() )
	}
	
	def noHayOponente(Retador retador){
		oponentesPosibles(retador).isEmpty()
	}
	
	def oponentesPosibles(Retador retador){
		jugadores.filter[it.mismoRankingSinSerElMismo(retador.jugador)].toList
	}	
	
	def mismoRankingSinSerElMismo(Jugador jug1, Jugador jug2){
		jug1.ranking.equals(jug2.ranking)  && jug1.nombre != jug2.nombre
	}	
		
	def void realizarDuelo(Retador ret1, Retador ret2){
		new Duelo(ret1,ret2).realizarse()
	}

	def denunciarJugador(Denuncia denuncia) {
		denuncia.castigar
	}
	
}