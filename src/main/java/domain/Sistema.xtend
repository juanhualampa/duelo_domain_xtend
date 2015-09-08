package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Sistema {
	List<Duelo> duelos = newArrayList
	List<EstadisticaJugadorPersonaje> estadisticas = newArrayList
	
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def iniciarReto(Retador retador, Ubicacion ubicacion){
		if(buscarOponente(retador).isEmpty()){
			// a joderse
		}
		else{
			realizarDuelo(retador,ubicacion,obtenerOponente(retador),Ubicacion.BOTTOM)
		}
	}
	
	def Retador obtenerOponente(Retador retador){
		new Retador(buscarOponente(retador).head.jugador,buscarOponente(retador).head.personaje)
	}
	
	def buscarOponente(Retador retador){
		estadisticas.filter[it.jugador.ranking.equals(retador.jugador.ranking) && retador.jugador != jugador].toList
	}
	
	def void realizarDuelo(Retador ret1, Ubicacion ub1 , Retador ret2, Ubicacion ub2){
		new Duelo(this,ret1,ub1,ret2,ub2).realizarse()
	}
	
	def EstadisticaJugadorPersonaje obtenerEstadistica(Retador retador) {
		if (esElPrimerDueloConEsteJugadorYEstePersonaje(retador)){
			// NOOB
		}
		else{
			obtenerEstadisticas(retador).head
		}
	}
		
	def List<EstadisticaJugadorPersonaje> obtenerEstadisticas(Retador retador){
		estadisticas.filter[it.personaje.equals(personaje) && it.jugador.equals(jugador)].toList
	}
	
	def esElPrimerDueloConEsteJugadorYEstePersonaje(Retador retador){
		obtenerEstadisticas(retador).isEmpty()
	}
	
	def actualizarEstadisticas(Retador retador, Ubicacion ubicacion) {
		
	}
	
	def denunciarJugador(Denuncia denuncia) {
		//denuncia.obtenerJugadorACastigar.castigar
		denuncia.castigar
	}
	
}