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
	
	def Retador obtenerOponente(Retador ret){
		if(noHayOponente(ret)){
			throw new NoHayOponenteException
		}
		retadorPara(ret)
	}
	
	def noHayOponente(Retador ret){
		otrosJugadores(ret).filter[conEstadisticasSimilaresA(ret)].isEmpty
	}
	
	def otrosJugadores(Retador ret){
		jugadores.filter[nombre != ret.jugador.nombre]
	}
	
	def Retador retadorPara(Retador ret){
		val jugador = otrosJugadores(ret).findFirst[conEstadisticasSimilaresA(ret)]
		this.toRetadores(toJugadorYPersonaje(jugador,ret.estadisticas(ret.personaje)))
	}
	
	def conEstadisticasSimilaresA(Jugador jug,Retador ret) {
		jug.estadisticasPersonajes.similaresA(ret.estadisticas(ret.personaje))
	}
		
	def Retador toRetadores(Pair<Jugador, Personaje> per){
		new NoIniciador(per.key, per.value, per.value.ubicacionIdeal)
	}
	
	def Pair<Jugador,Personaje> toJugadorYPersonaje(Jugador jugador, EstadisticasPersonajes est) {
		jugador -> personajeCompatible(jugador.estadisticasPersonajes, est)
	}
	
	def Personaje personajeCompatible (List<EstadisticasPersonajes> lista , EstadisticasPersonajes est){
		lista.findFirst[esSimilarA(est)].personaje
	}
	
	def boolean similaresA(List<EstadisticasPersonajes> list, EstadisticasPersonajes est){
		list.exists[esSimilarA(est)]
	}
	
	def boolean esSimilarA(EstadisticasPersonajes est1, EstadisticasPersonajes est2) {
		est1.calificacion.categoria.equals(est2.calificacion.categoria)
	}			
	
	def Duelo realizarDuelo(Retador ret1, Retador ret2){		
		val duelo = new Duelo(ret1,ret2)
		duelo.realizarse
		duelo
	}

	def denunciarJugador(Duelo duelo , Motivo mot, Descripcion desc) {
		val den = new Denuncia(duelo,mot,desc)
		den.castigar
	}	
	
	def Bot dameAMRX(Retador ret) {
		val cantPersonajesRandom =new Random().nextInt(ret.jugador.estadisticasPersonajes.size )
		generarMRX(ret,cantPersonajesRandom)
	}
	
	def generarMRX(Retador ret, int nroAzaroso){
		val personajeRandom = ret.jugador.estadisticasPersonajes.map[ret.personaje].get(nroAzaroso)
		val estadisticas = ret.jugador.estadisticasPersonajes
		val bot = new Jugador("MR.X", estadisticas)
		new Bot(bot, personajeRandom, Ubicacion.BOTTOM)
	}
	
}