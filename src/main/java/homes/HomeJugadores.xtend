package homes

import org.uqbar.commons.model.CollectionBasedHome
import java.util.List
import java.util.ArrayList
import java.util.Arrays
import domain.Jugador
import domain.EstadisticasPersonajes
import org.uqbar.commons.utils.ApplicationContext

class HomeJugadores extends CollectionBasedHome<Jugador> {
	
	new() {
		this.init
	}
	
	/**
	 * Inicialización del juego de datos del repositorio
	 */
	def void init() {
					
		val estadisticasPersonajes = new ArrayList<EstadisticasPersonajes>		
		estadisticasPersonajes.add(getEstadisticas("El Chelo"))
		estadisticasPersonajes.add(getEstadisticas("Javito"))
		estadisticasPersonajes.add(getEstadisticas("Ariel Pucheta"))
		estadisticasPersonajes.add(getEstadisticas("Pablo Lescano"))
		estadisticasPersonajes.add(getEstadisticas("Leo Mattioli"))
		estadisticasPersonajes.add(getEstadisticas("El Polaco"))
		this.create("La Tota",estadisticasPersonajes)
		
	}
	
	def getEstadisticas(String nombrePersonaje) {
		(ApplicationContext.instance.getSingleton(typeof(EstadisticasPersonajes)) as HomeEstadisticasPersonajes).get(nombrePersonaje)
	}
	
	def obtenerDatos(String esp1, String esp2){
		val ret = new ArrayList<String>()
		ret.addAll(Arrays.asList(esp1,esp2))
		ret
	}
	
	def List<Jugador> getJugadores() {
		allInstances	
	}
	
	def Jugador get(String nombre) {
		jugadores.findFirst [ j | j.nombre.equals(nombre) ]
	}
	
	override createExample() {
		new Jugador
	}
	
	def void create(String nombre, List<EstadisticasPersonajes> estadisticasPersonajes){
		val jugador = new Jugador	
		jugador.nombre = nombre	
		jugador.estadisticasPersonajes = estadisticasPersonajes
		jugador.denuncias = newArrayList
		jugador.duelos = newArrayList
		jugador.denuncias = newArrayList		
		this.create(jugador)
	}
	
	override def Class<Jugador> getEntityType() {
		typeof(Jugador)
	}
	
	override protected getCriterio(Jugador example) {
	}
	
	}

