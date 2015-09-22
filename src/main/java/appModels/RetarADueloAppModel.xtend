package appModels
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Personaje
import org.uqbar.commons.utils.Observable
import java.util.List
import domain.EstadisticasPersonajes
import org.uqbar.commons.model.ObservableUtils
import domain.Jugador
import domain.Ubicacion
import domain.Retador
import domain.Iniciador
import org.uqbar.commons.model.UserException
import java.util.regex.Pattern
import java.util.regex.Matcher

@Accessors
@Observable
class RetarADueloAppModel {
	
	String personajeABuscar
	Jugador jugador
	PersonajePuntaje personajeConPuntaje
	Ubicacion ubicacionSeleccionada
	
	new(Jugador jugador){
		personajeABuscar = "";
		this.jugador = jugador
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
	
//	def setPersonajeABuscar(String nombre){
//		personajeABuscar = nombre
//		ObservableUtils.firePropertyChanged(this,"personajesConPuntaje",this.personajesConPuntaje)
//	}

	def setPersonajeABuscar(String nombre){
		if (!esAlfanumerico(nombre))
			throw new UserException("Solo se admiten caracteres alfanumericos.")
		personajeABuscar = nombre
		ObservableUtils.firePropertyChanged(this,"personajesConPuntaje",this.personajesConPuntaje)
	}
	
	def esAlfanumerico(String nombre) {
		  var Pattern r = Pattern.compile("[0-9A-Za-z ]*");
		  var Matcher m = r.matcher(nombre);
		  if(m.matches){
		  	return true
		  }else{
		  	return false
		  }
	}
		
	def setPersonajesConPuntajes(List<PersonajePuntaje> p){
		p
	}
	
	def List<PersonajePuntaje> getPersonajesConPuntaje(){
		val personajesConPuntaje = this.jugador.estadisticasPersonajes.map[new PersonajePuntaje(it.personaje, it.calificacion.categoria)]
		if (personajeABuscar != ""){			
			personajesConPuntaje.filter[it.personaje.nombre.contains(personajeABuscar)].toList
		}
		else{
			personajesConPuntaje
		}		
	}
		
	def EstadisticasPersonajes getEstadisticaPersonajeSeleccionado(){
		if (personajeConPuntaje == null){
			jugador.estadisticasPersonajes.get(0)
		}
		else{
			jugador.estadisticas(personajeConPuntaje.personaje)
		}		
	}
		
	def datosDeEstadisticas(){
		estadisticaPersonajeSeleccionado.dameSusPropiedades
	}
	
	def retador(){
		new Iniciador(this.jugador,this.personajeSeleccionado,this.ubicacionSeleccionada)
	}
	
	def dameSusPropiedades(EstadisticasPersonajes it) {
		#[new Pair("Jugadas",vecesUsadoAntesDelDuelo),
			new Pair("Ganadas",vecesQueGanoDuelo),
			new Pair("Kills",vecesKills),	
			new Pair("Deads",vecesDeads),	
			new Pair("Assists",vecesAssist),
			new Pair("Mejor ubicacion",mejorUbicacion),
			new Pair("Puntaje",calificacion.nro)]
	}
	
	def obtenerDuelo(Ubicacion ubicacion) {
		this.jugador.iniciarDuelo(personajeSeleccionado,ubicacion)
	}
	

}