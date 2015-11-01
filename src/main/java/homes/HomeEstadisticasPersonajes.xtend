package homes

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import domain.EstadisticasPersonajes
import java.util.List
import domain.Personaje
import org.uqbar.commons.utils.ApplicationContext
import domain.Calificacion
import java.util.ArrayList
import java.util.Arrays
import domain.Ubicacion

@Observable
class HomeEstadisticasPersonajes extends CollectionBasedHome<EstadisticasPersonajes> {
	
	new() {
		this.init
	}
	
	/**
	 * Inicialización del juego de datos del repositorio
	 */
	def void init() {
		var ubi1 = Ubicacion.TOP;
		var ubi2 = Ubicacion.BOTTOM;
		var ubi3 = Ubicacion.MIDDLE;
		var ubi4 = Ubicacion.JUNGLE;
		
		val calRampage = new Calificacion("RAMPAGE",100)
		val calDominador = new Calificacion("DOMINADOR",75)
		val calKiller = new Calificacion("KILLING_SPREAD",60)
		val calManco = new Calificacion("MANCO",15)
		val calNoob = new Calificacion("NOOB",5)
		
		///////////////////////CREO ESTADISTICAS PARA PERSONAJES //////////////////////////////
		val ubicacionesUsadas1 = new ArrayList<Ubicacion>
		ubicacionesUsadas1.addAll(Arrays.asList(ubi1, ubi1, ubi1, ubi1, ubi1, ubi1, ubi2))
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas2.addAll(Arrays.asList(ubi2, ubi2, ubi2, ubi3, ubi4))
		
		val ubicacionesUsadas3 = new ArrayList<Ubicacion>
		ubicacionesUsadas3.addAll(Arrays.asList(ubi1, ubi2, ubi4))
		
		val ubicacionesUsadas4 = new ArrayList<Ubicacion>
		ubicacionesUsadas4.addAll(Arrays.asList(ubi3, ubi4))
		
		val ubicacionesUsadas5= new ArrayList<Ubicacion>
		ubicacionesUsadas5.addAll(Arrays.asList(ubi4))
		
		this.create(getPersonaje("El Chelo"), 7, 6, 5, 4, 3, ubicacionesUsadas1, ubi1,calRampage)
		this.create(getPersonaje("Javito"), 5, 4, 3, 2, 1, ubicacionesUsadas2, ubi1,calDominador)
		this.create(getPersonaje("Ariel Pucheta"), 3, 1, 2, 1, 1, ubicacionesUsadas3, ubi1,calKiller)
		this.create(getPersonaje("Pablo Lescano"), 2, 1, 1, 1, 1, ubicacionesUsadas4, ubi1,calManco)
		this.create(getPersonaje("Leo Mattioli"), 1, 0, 0, 1, 1, ubicacionesUsadas5, ubi1,calNoob)
		this.create(getPersonaje("El Polaco"))		
		
	}
	
	def obtenerDatos(String esp1, String esp2){
		val ret = new ArrayList<String>()
		ret.addAll(Arrays.asList(esp1,esp2))
		ret
	}
	
	def List<EstadisticasPersonajes> getEstadisticasPersonajes() {
		allInstances	
	}
	
	def EstadisticasPersonajes get(String nombre) {
		estadisticasPersonajes.findFirst [ p | p.personaje.nombre.equals(nombre) ]
	}
	
	override protected getCriterio(EstadisticasPersonajes arg0) {
	}
	
	override createExample() {
		new EstadisticasPersonajes
	}
	
	def getPersonaje(String nombrePersonaje) {
		(ApplicationContext.instance.getSingleton(typeof(Personaje)) as HomePersonajes).get(nombrePersonaje)
	}
	
	
	def void create(Personaje per){
		val estadisticasPersonajes = new EstadisticasPersonajes
		estadisticasPersonajes.personaje = per
		this.create(estadisticasPersonajes)
	}
	
	def void create(Personaje per, int vecesUsadoAntesDelDuelo, int vecesQueGanoDuelo, int vecesKills, int vecesDeads,
		 int vecesAssist , List<Ubicacion> ubicacionesUsadas, Ubicacion mejorUbicacion, Calificacion calificacion) {
		
		val estadisticasPersonajes = new EstadisticasPersonajes
		estadisticasPersonajes.personaje = per
		estadisticasPersonajes.vecesUsadoAntesDelDuelo = vecesUsadoAntesDelDuelo
		estadisticasPersonajes.vecesQueGanoDuelo = vecesQueGanoDuelo
		estadisticasPersonajes.vecesKills = vecesKills
		estadisticasPersonajes.vecesDeads = vecesDeads
		estadisticasPersonajes.vecesAssist = vecesAssist
		estadisticasPersonajes.ubicacionesUsadas = ubicacionesUsadas	
		estadisticasPersonajes.mejorUbicacion = mejorUbicacion
		estadisticasPersonajes.calificacion = calificacion
		this.create(estadisticasPersonajes)
	}
	
	override def Class<EstadisticasPersonajes> getEntityType() {
		typeof(EstadisticasPersonajes)
	}
	
	
	}