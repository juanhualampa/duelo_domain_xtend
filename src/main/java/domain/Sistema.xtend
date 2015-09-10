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
		val contrincante = buscarOponente(retador).head
		new Retador(contrincante,contrincante.personajeSeleccionado,Ubicacion.BOTTOM, new NoIniciador() )
	}
	
	def noHayOponente(Retador retador){
		buscarOponente(retador).isEmpty()
	}
	
	def buscarOponente(Retador retador){
		jugadores.filter[it.ranking.equals(retador.jugador.ranking) && it.nombre != retador.jugador.nombre].toList
	}
	
	def void realizarDuelo(Retador ret1, Retador ret2){
		new Duelo(ret1,ret2)
	}
	
//	def EstadisticasPersonajes obtenerEstadistica(Retador retador) {
//		if (esElPrimerDueloConEsteJugadorYEstePersonaje(retador)){
//			retador.crearEstadisticaParaEstePersonaje()
//		}
//		else{
//			obtenerEstadisticas(retador)
//		}
//	}
	
//	def crearEstadisticaParaEstePersonaje(Retador retador) {
//		retador.personaje.estadistica = new EstadisticasPersonajes()
//		obtenerEstadisticas(retador)		
//	}
//		
//	def EstadisticasPersonajes obtenerEstadisticas(Retador retador){
//		retador.personaje.estadistica
//	}
//	
//	def esElPrimerDueloConEsteJugadorYEstePersonaje(Retador retador){
//		retador.personaje.estadistica.vecesUsadoAntesDelDuelo.equals(0)
//		/*
//		 * Esto podria verse si por ej , si conviene o no poner un estado por defecto ?
//		 */
//	}
	
	def denunciarJugador(Denuncia denuncia) {
		denuncia.castigar
	}
	
}