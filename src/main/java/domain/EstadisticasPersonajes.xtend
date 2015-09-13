package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class EstadisticasPersonajes {
	
	int vecesUsadoAntesDelDuelo
	int vecesQueGanoDuelo	
	int vecesKills
	int vecesDeads
	int vecesAssist	
	List<Ubicacion> ubicacionesUsadas	
	Ubicacion mejorUbicacion
	Calificacion calificacion
	
	
	new(){
		this.vecesUsadoAntesDelDuelo = 0
		this.vecesQueGanoDuelo = 0
		this.vecesKills = 0
		this.vecesDeads = 0
		this.vecesAssist = 0
		this.ubicacionesUsadas = newArrayList	
		this.mejorUbicacion = Ubicacion.BOTTOM
		this.calificacion = new Calificacion("NOOB",5)	
	}
	
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
	
	def poderDeAtaque() {
		calificacion.nro + ((vecesKills + vecesAssist / 2 - vecesDeads) * vecesUsadoAntesDelDuelo)
	}
		
}

