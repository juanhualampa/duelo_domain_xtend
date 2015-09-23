package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Accessors
@Observable
class EstadisticasPersonajes extends Entity {
	
	int vecesUsadoAntesDelDuelo
	int vecesQueGanoDuelo	
	int vecesKills
	int vecesDeads
	int vecesAssist	
	List<Ubicacion> ubicacionesUsadas	
	Ubicacion mejorUbicacion
	Calificacion calificacion
	Personaje personaje
	
	
	new(Personaje personaje){
		this.personaje = personaje
		this.vecesUsadoAntesDelDuelo = 0
		this.vecesQueGanoDuelo = 0
		this.vecesKills = 0
		this.vecesDeads = 0
		this.vecesAssist = 0
		this.ubicacionesUsadas = newArrayList	
		this.mejorUbicacion = personaje.ubicacionIdeal
		this.calificacion = new Calificacion("NOOB",5)	
	}
	
	new(Personaje personaje,int vecesUsadoAntesDelDuelo, 
		int vecesQueGanoDuelo, int vecesKills, int vecesDeads,
		 int vecesAssist , List<Ubicacion> ubicacionesUsadas,
		 Ubicacion mejorUbicacion, Calificacion calificacion ){
		this.personaje = personaje
		this.vecesUsadoAntesDelDuelo = vecesUsadoAntesDelDuelo
		this.vecesQueGanoDuelo = vecesQueGanoDuelo
		this.vecesKills = vecesKills
		this.vecesDeads = vecesDeads
		this.vecesAssist = vecesAssist
		this.ubicacionesUsadas = ubicacionesUsadas	
		this.mejorUbicacion = mejorUbicacion
		this.calificacion = calificacion	
	}
	
	new() {	}
	
	def void agregarUnaParticipacion() {
		vecesUsadoAntesDelDuelo += 1
	}
	
	def agregarUnaVictoria() {
		vecesQueGanoDuelo += 1
	}
	
	def sumarKill() {
		vecesKills += 1
	}
	
	def sumarDeads() {
		vecesDeads += 1
	}
	
	def agregarAssist(){
		vecesAssist += 1
	}
	
	/**
	 * devuelve el poder de ataque del personaje para el jugador
	 */
	def poderDeAtaque() {
		calificacion.nro + ((vecesKills + vecesAssist / 2 - vecesDeads) * vecesUsadoAntesDelDuelo)
	}
		
}

