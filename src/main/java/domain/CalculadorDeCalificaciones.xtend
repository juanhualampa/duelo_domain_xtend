package domain

import java.util.Random

class CalculadorDeCalificaciones {
	
	def Calificacion calcular(Veredicto v) {
		val nroAlAzar = new Random().nextInt(100)
		var Calificacion res = new Calificacion("NOOB",5)
		if (v.estadisticas.usasteAlPersonajeEnUbicacionIdealAlMenos(v,5) && esNroAlAzarMayorA(nroAlAzar,90) ){
			res = new Calificacion("RAMPAGE",100)
		}
		if (v.usasteCualquierPersonajeEnUbicacionIdealMasDe(2) && esNroAlAzarMayorA(nroAlAzar,70)){
			res = new Calificacion("DOMINADOR",75)
		}
		if(esNroAlAzarMayorA(nroAlAzar,50)){
			res = new Calificacion("KILLING_SPREAD",60)
		}
		if(v.participante.ubicacion.esUbicacionIdeal(v)){
			res = new Calificacion("MANCO",15)
		}
		res
	}
	
	def esUbicacionIdeal(Ubicacion ubicacion,Veredicto v){
		ubicacion.equals(v.participante.personaje.ubicacionIdeal)
	}
	
	def boolean usasteAlPersonajeEnUbicacionIdealAlMenos(EstadisticasPersonajes e,Veredicto v ,int veces){
		e.ubicacionesUsadas.filter[it.esUbicacionIdeal(v)].size >= veces
	}
	
	def boolean usasteCualquierPersonajeEnUbicacionIdealMasDe(Veredicto v, int veces){
		! v.participante.jugador.personajes.filter[it.estadistica.usasteAlPersonajeEnUbicacionIdealAlMenos(v,veces)].isEmpty
		// TODO: 
	}
	
	def esNroAlAzarMayorA(int nroAzaroso ,int nro){
		nroAzaroso > nro
	}
}