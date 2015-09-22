package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import java.util.Random
import java.util.ArrayList

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
	
	def Retador obtenerOponente(Retador it){
		oponentesPosibles(it).head
	}
	
	def List<Retador> oponentesPosibles(Retador ret) {
		val jugadoresYpersonajes = 	jugadoresDistintosAlRetadorConCalifacionesSimilares(ret).toJugadorYPersonaje(ret)
		jugadoresYpersonajes.toRetadores
	}
	
	def List<Jugador> jugadoresDistintosAlRetadorConCalifacionesSimilares(Retador ret){
		jugadores.filter[nombre != ret.jugador.nombre &&
			estadisticasPersonajes.esSimilarA(ret.estadisticas(ret.personaje))].toList
	}
	
	def toJugadorYPersonaje(List<Jugador> js, Retador ret){
		js.map[it.jugadorYPersonaje(ret.estadisticas(ret.personaje))].toList
	}	
	
	def List<Retador> toRetadores(List<Pair<Jugador, Personaje>> pares){
		pares.map[(new NoIniciador(it.key,it.value,Ubicacion.BOTTOM))]
	}
	
	def Personaje personajeCompatible (List<EstadisticasPersonajes> lista , EstadisticasPersonajes est){
		lista.filter[it.esSimilarA(est)].head.personaje
	}
	
	def Pair<Jugador,Personaje> jugadorYPersonaje(Jugador jugador, EstadisticasPersonajes est) {
		jugador -> personajeCompatible(jugador.estadisticasPersonajes,est)
	}
	
	def boolean esSimilarA(List<EstadisticasPersonajes> list, EstadisticasPersonajes est){
		list.exists[it.esSimilarA(est)]
	}
	
	def boolean esSimilarA(EstadisticasPersonajes est1, EstadisticasPersonajes est2) {
		est1.calificacion.categoria.equals(est2.calificacion.categoria)
	}		
	
	def noHayOponente(Retador it){
		oponentesPosibles.isEmpty
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