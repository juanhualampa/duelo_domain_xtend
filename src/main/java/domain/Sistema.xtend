package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Sistema {
	List<Duelo> duelos = newArrayList
	List<Jugador> jugadores = newArrayList
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def iniciarReto(Retador retador){
		if(buscarOponente(retador).isEmpty()){
			// a joderse
		}
		else{
			realizarDuelo(retador,obtenerOponente(retador))
		}
	}
	
	def Retador obtenerOponente(Retador retador){
		new Retador(buscarOponente(retador).head,buscarOponente(retador).head.personajes.get(0),Ubicacion.BOTTOM )
	}
	
	def buscarOponente(Retador retador){
		jugadores.filter[it.ranking.equals(retador.jugador.ranking) && it != retador.jugador].toList
	}
	
	def void realizarDuelo(Retador ret1, Retador ret2){
		new Duelo(this,ret1,ret2).realizarse()
	}
	
	def EstadisticasPersonajes obtenerEstadistica(Retador retador) {
		if (esElPrimerDueloConEsteJugadorYEstePersonaje(retador)){
			// NOOB
		}
		else{
			obtenerEstadisticas(retador)
		}
	}
		
	def EstadisticasPersonajes obtenerEstadisticas(Retador retador){
		retador.personaje.estadistica
	}
	
	def esElPrimerDueloConEsteJugadorYEstePersonaje(Retador retador){
		retador.personaje.estadistica.equals(null)
	}
	
	def denunciarJugador(Denuncia denuncia) {
		denuncia.castigar
	}
	
}