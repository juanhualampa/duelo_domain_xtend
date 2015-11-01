package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import java.util.Random
import java.util.ArrayList
import duelos.Duelo
import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import duelos.Motivo
import retador.Bot

@Observable
@Accessors
class Juego {
	List<Jugador> jugadores = newArrayList	
		
	/**
	 * Toma un retador y una ubicacion y le busca un contrincante de su nivel
	 * @throws NoHayOponenteException si no encontro rival
	 */
	def Duelo iniciarReto(Jugador it, Personaje per ,Ubicacion ubic){
		val ret = new Iniciador(it,per,ubic)
		realizarDuelo(ret, ret.obtenerOponente)
	}
	
	def Retador obtenerOponente(Retador it){
		if(noHayOponente(it)){
			throw new NoHayOponenteException
		}
		oponente(it)
	}
	
	def noHayOponente(Retador ret){
		oponente(ret) == null
	}
	
	def Retador oponente(Retador ret){
		retadorPara(ret)
	}
	
	def Retador retadorPara(Retador ret){
		val jugador = jugadores.findFirst[nombre != ret.jugador.nombre && conEstadisticasSimilaresA(ret)]
		this.toRetadores(toJugadorYPersonaje(jugador,ret.estadisticas(ret.personaje)))
	}
	
	def conEstadisticasSimilaresA(Jugador it,Retador ret) {
		estadisticasPersonajes.similaresA(ret.estadisticas(ret.personaje))
	}
		
	def Retador toRetadores(Pair<Jugador, Personaje> it){
		new NoIniciador(it.key, it.value, it.value.ubicacionIdeal)
	}
	
	def Pair<Jugador,Personaje> toJugadorYPersonaje(Jugador jugador, EstadisticasPersonajes est) {
		jugador -> personajeCompatible(jugador.estadisticasPersonajes, est)
	}
	
	def Personaje personajeCompatible (List<EstadisticasPersonajes> lista , EstadisticasPersonajes est){
		lista.findFirst[it.esSimilarA(est)].personaje
	}
	
	def boolean similaresA(List<EstadisticasPersonajes> list, EstadisticasPersonajes est){
		list.exists[it.esSimilarA(est)]
	}
	
	def boolean esSimilarA(EstadisticasPersonajes est1, EstadisticasPersonajes est2) {
		est1.calificacion.categoria.equals(est2.calificacion.categoria)
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
		val bot = new Jugador("MR.X", estadisticas)
		new Bot(bot, personajeRandom, Ubicacion.BOTTOM)
	}
	
}