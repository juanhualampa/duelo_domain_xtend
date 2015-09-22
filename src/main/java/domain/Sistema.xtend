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
		armarDuelo(new Iniciador(it,per,ubic))
	}
		
	def Duelo armarDuelo(Retador ret){
		try{
			realizarDuelo(ret,ret.obtenerOponente)
		}
		catch (Exception e){ throw new NoHayOponenteException()	}
	}
	
	/**
	 * Obtiene un oponente de la lista de posibles cargada en el Sistema. Por default, la posicion sera BOTTOM
	 */
	def Retador obtenerOponente(Retador it){
		val contrincante = oponentesPosibles.head
		new NoIniciador(contrincante,contrincante.elegirPersonaje(it),Ubicacion.BOTTOM)
	}
	
	def Personaje elegirPersonaje(Jugador it, Retador ret) {
		estadisticasPersonajes.filter[contieneAlgunRivalPara(ret)].head.personaje
	}
		
	def noHayOponente(Retador it){
		oponentesPosibles.isEmpty
	}
	
	/**
	 * @return lista de Jugadores posibles
	 */
	def oponentesPosibles(Retador retador){
		jugadores.filter[it.mismoRankingSinSerElMismo(retador)].toList
	}	
	
	/**
	 * evalua 2 jugadores y devuelve true si no son el mismo y poseen el mismo ranking
	 */
	def mismoRankingSinSerElMismo(Jugador jug, Retador ret){
		//ranking.equals(jug2.ranking)  && nombre != jug2.nombre
		jug.nombre != ret.jugador.nombre && jug.estadisticasPersonajes.exists[contieneAlgunRivalPara(ret)]
	}
	
	def boolean contieneAlgunRivalPara(EstadisticasPersonajes est, Retador ret){
		est.calificacion.nro.similar(ret.estadisticas(ret.personaje).calificacion.nro)
	}
	
	def similar(Integer it, int i) {
		it >= i + 5 || it <= i + 5
	}
		
	def Duelo realizarDuelo(Retador it, Retador ret){
		
		val duelo = new Duelo(it,ret)
		duelo.realizarse
		duelo
	}

	def denunciarJugador(Duelo duelo , Motivo mot, Descripcion desc) {
		val den = new Denuncia(duelo,mot,desc)
		den.castigar
	}
	
	
	def Bot dameAMRX(Retador it) {
		val cantPersonajesRandom =new Random().nextInt(it.jugador.estadisticasPersonajes.size )
		generarMRX(it,cantPersonajesRandom)
	}
	
	def generarMRX(Retador it, int nroAzaroso){
		val personajeRandom = it.jugador.estadisticasPersonajes.map[personaje].get(nroAzaroso)
		val estadisticas = it.jugador.estadisticasPersonajes
		val bot = new Jugador("MR.X",estadisticas)
		new Bot(bot,personajeRandom,Ubicacion.BOTTOM)
	}
	
}