package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import java.util.Random

@Observable
@Accessors
class Sistema {
	List<Jugador> jugadores = newArrayList	
	Retador oponentePorDefecto
	
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 */
	def Duelo iniciarReto(Jugador it, Personaje per ,Ubicacion ubic){
		armarDuelo(new Retador(it,per,ubic,new Iniciador))
	}
	
	def noPoseeEstadisticas(Jugador it, Personaje personaje) {
		! estadisticasPersonajes.exists[it.personaje.equals(personaje)]
	}
	
	def Duelo armarDuelo(Retador ret){
		try{
			realizarDuelo(ret,ret.obtenerOponente)
		}
		catch (Exception e){
			throw new NoHayOponenteException()
		}
//		if(ret.noHayOponente){
//			// a joderse
//			// ACA NO PUEDO MOSTRAR VENTANA PORQUE ESTOY EN EL MODELO !!!
//			// TENGO QUE DESDE LA VISTA (O APPMODEL) CATCHEAR LA EXCEPCION
//			throw new NoHayOponenteException()
//		}
//		else{
//			realizarDuelo(ret,ret.obtenerOponente)
//		}
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
		
	def Duelo realizarDuelo(Retador it, Retador ret2){
		val duelo = new Duelo(it,ret2)
		duelo.realizarse
		duelo
	}

	def denunciarJugador(Duelo duelo , Motivo mot, Descripcion desc) {
		val den = new Denuncia(duelo,mot,desc)
		den.castigar
	}
	
	def Retador dameAMRX(Retador it) {
		val cantPersonajesRandom =new Random().nextInt(it.jugador.estadisticasPersonajes.size )
		generarMRX(it,cantPersonajesRandom)
	}
	def generarMRX(Retador it, int nroAzaroso){
		val personajeRandom = it.jugador.estadisticasPersonajes.map[personaje].get(nroAzaroso)
		val estadisticas = it.jugador.estadisticasPersonajes
		val bot = new Jugador("MR.X",estadisticas)
		new Retador(bot,personajeRandom,Ubicacion.BOTTOM,new Bot)
	}
	
}