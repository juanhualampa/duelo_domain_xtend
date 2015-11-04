package appModels
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Personaje
import org.uqbar.commons.utils.Observable
import java.util.List
import domain.EstadisticasPersonajes
import org.uqbar.commons.model.ObservableUtils
import domain.Jugador
import domain.Ubicacion
import retador.Iniciador
import org.uqbar.commons.model.UserException
import java.util.regex.Pattern
import homes.HomeJuego
import java.util.HashMap
import retador.Iniciador
import resultado.Resultado
import retador.Retador
import duelos.Duelo

@Accessors
@Observable
class RetarADueloAppModel {
	
	String personajeABuscar
	PersonajePuntaje personajeConPuntaje
	Ubicacion ubicacionSeleccionada
	HomeJuego homeJuego
	
	new(HomeJuego homeJuego){
		personajeABuscar = "";
		this.homeJuego = homeJuego
	}
	
	def posiciones(){
		#[Ubicacion.TOP,Ubicacion.BOTTOM,Ubicacion.MIDDLE, Ubicacion.JUNGLE]
	}
	
	def setUbicacionSeleccionada(Ubicacion ubicacion){
		ubicacionSeleccionada = ubicacion
	}
	
	def isEligioPersonaje(){
		 personajeConPuntaje != null
	}
			
	def Personaje getPersonajeSeleccionado(){
		personajeConPuntaje.personaje
	}
	
	def ubicacionesPosibles(){
		#[Ubicacion.TOP,Ubicacion.MIDDLE,Ubicacion.JUNGLE,Ubicacion.BOTTOM]
	}
		
	def void setPersonajeConPuntaje(PersonajePuntaje per) {
		this.personajeConPuntaje = per
		cambioPuedeJugar
		ObservableUtils.firePropertyChanged(this,"estadisticaPersonajeSeleccionado")
	}
	
	def cambioPuedeJugar(){
		ObservableUtils.firePropertyChanged(this, "eligioPersonaje", this.eligioPersonaje)
	}
	
	def setPersonajeABuscar(String nombre){
		if (nombre.noEsAlfanumerico)
			throw new UserException("Solo se disponen de personajes con nombres de caracteres alfanumericos !")
		personajeABuscar = nombre
		ObservableUtils.firePropertyChanged(this,"personajesConPuntaje") //this.personajesConPuntaje
	}
	
	def noEsAlfanumerico(String nombre) {
		  ! Pattern.compile("[0-9A-Za-z ]*").matcher(nombre).matches
	}
	
	def juego(){
		this.homeJuego.juego
	}
	
	def obtenerJugador(Integer idJugador){
		this.jugadores.findFirst[id.equals(idJugador)]
	}
	
	def jugadores(){
		this.homeJuego.juego.jugadores
	}
		
	def setPersonajesConPuntajes(List<PersonajePuntaje> p){
		p
	}
	
	def List<PersonajePuntaje> getPersonajesConPuntaje(Integer idJugador){
		val personajesConPuntaje = this.juego.jugadores.findFirst
		[it.id.equals(idJugador)].estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.categoria)]
		if (personajeABuscar != ""){			
			personajesConPuntaje.filter[it.personaje.nombre.contains(personajeABuscar)].toList
		}
		else{
			personajesConPuntaje
		}		
	}
		
	def EstadisticasPersonajes getEstadisticaPersonajeSeleccionado(Integer idJ){
		if (personajeConPuntaje == null){
			obtenerJugador(idJ).estadisticasPersonajes.get(0)
		}
		else{
			obtenerJugador(idJ).estadisticas(personajeConPuntaje.personaje)
		}		
	}
			
	def datosDeEstadisticas(Integer idJugador, Integer idPersonaje){
		this.homeJuego.estadisticasDePersonajeSeleccionado(idJugador,idPersonaje).dameSusPropiedades
	}
	
	def retador(Integer idJugador){
		new Iniciador(obtenerJugador(idJugador),this.personajeSeleccionado,this.ubicacionSeleccionada)
	}
	
	def dameSusPropiedades(EstadisticasPersonajes it) {
		val nose = new HashMap<String, Object>();
		nose.put("Jugadas",vecesUsadoAntesDelDuelo)
		nose.put("Ganadas",vecesQueGanoDuelo)
		nose.put("Kills",vecesKills)
		nose.put("Deads",vecesDeads)	
		nose.put("Assists",vecesAssist)
		nose.put("Mejor ubicacion",mejorUbicacion)
		nose.put("Puntaje",calificacion.categoria)
		nose
	}
	
	def iniciarDuelo(Integer idJugador,Integer idPersonaje,String pos){
		val duelo = juego.iniciarReto(obtenerJugador(idJugador),obtenerPersonaje(idJugador,idPersonaje),
			dameUbi(pos))
		duelo.datos
	}
	
	def datos(Duelo duelo){
		#[propiedadesParaLasEstadisticas(duelo.retador),propiedadesParaLasEstadisticas(duelo.retado),duelo.resultado.mensaje(duelo)]
	}
	
	def mensaje(Resultado resultado,Duelo duelo){
		#[duelo.retador.personaje.nombre,duelo.retado.personaje.nombre]
	}
	
	def propiedadesParaLasEstadisticas(Retador it) {
		jugador.estadisticas(personaje).dameSusPropiedades
	}
	
	def dameUbi(String pos) {
		Ubicacion.valueOf(pos)
	}
	
	def obtenerPersonaje(Integer idJugador, Integer idPersonaje) {
		obtenerJugador(idJugador).personajePor(idPersonaje)
	}
	
	def personajePor(Jugador jugador, Integer idPersonaje) {
		jugador.estadisticasPersonajes.map[personaje].findFirst[id.equals(idPersonaje)]
	}
	
	def obtenerDuelo(Integer idJugador,Ubicacion ubicacion) {
		obtenerJugador(idJugador).iniciarDuelo(personajeSeleccionado,ubicacion)
	}
}