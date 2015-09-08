package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List


@Accessors
class EstadisticasPersonajes {
	
	int vecesUsadoAntesDelDuelo
	int vecesQueGanoDuelo	
	int vecesKills
	int vecesDeads
	int vecesAssist	
	List<Ubicacion> ubicacionesUsadas	
	Ubicacion mejorUbicacion
	Integer calificacion
	Desempenio desempenio
	
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
	
	
	
}