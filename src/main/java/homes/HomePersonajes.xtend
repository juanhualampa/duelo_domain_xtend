package homes

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import domain.Personaje
import domain.Ubicacion
import java.util.List
import java.util.ArrayList
import java.util.Arrays

@Observable
class HomePersonajes extends CollectionBasedHome<Personaje> {
	
	new() {
		this.init
	}
	
	/**
	 * Inicialización del juego de datos del repositorio
	 */
	def void init() {
		
		this.create("El Chelo",obtenerDatos("vision nocturna","Bloqueo"),
			obtenerDatos("Cuerpo a cuerpo","tactica defensiva"),Ubicacion.BOTTOM)
			
		this.create("Javito",obtenerDatos("Ataque","puño de acero"),
			obtenerDatos("vision nocturna","Poder especial"),Ubicacion.TOP)
			
		this.create("Ariel Pucheta",obtenerDatos("Ataque","Patadas voladoras"),
			obtenerDatos("vision nocturna","Bloqueo"),Ubicacion.BOTTOM	)
			
		this.create("Pablo Lescano",obtenerDatos("Defensa","golpe de piernas"),
			obtenerDatos("vision nocturna","Bloqueo"),Ubicacion.JUNGLE)
			
		this.create("Leo Mattioli",obtenerDatos("Ataque","Patadas voladoras"),
			obtenerDatos("La dieta","Bloqueo"),Ubicacion.MIDDLE)
			
		this.create("El Polaco",obtenerDatos("Ataque","Cuerpo a cuerpo"),
			obtenerDatos("Los gatos","Bloqueo"),Ubicacion.MIDDLE)
	}
	
	def obtenerDatos(String esp1, String esp2){
		val ret = new ArrayList<String>()
		ret.addAll(Arrays.asList(esp1,esp2))
		ret
	}
	
	def List<Personaje> getPersonajes() {
		allInstances	
	}
	
	def Personaje get(String nombre) {
		personajes.findFirst [ p | p.nombre.equals(nombre) ]
	}
	
	override protected getCriterio(Personaje arg0) {
	}
	
	override createExample() {
		new Personaje
	}
	
	def void create(String nombre,List<String> especialidades, List<String> debilidades ,Ubicacion ubicacionIdeal) {
		var personaje = new Personaje
		personaje.especialidades = especialidades
		personaje.debilidades = debilidades
		personaje.ubicacionIdeal = ubicacionIdeal
		this.create(personaje)
	}
	
	override def Class<Personaje> getEntityType() {
		typeof(Personaje)
	}
	}