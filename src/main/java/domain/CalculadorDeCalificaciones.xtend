package domain

import java.util.Random

class CalculadorDeCalificaciones {
	
	def Calificacion calcular(Retador it) {
		val nroAlAzar = new Random().nextInt(100)
		var Calificacion res = new Calificacion("NOOB",5)
		if (estadisticas(it.personaje).usasteAlPersonajeEnUbicacionIdealAlMenos(it,5) && esNroAlAzarMayorA(nroAlAzar,90) ){
			res = new Calificacion("RAMPAGE",100)
		}
		if (usasteCualquierPersonajeEnUbicacionIdealMasDe(2) && esNroAlAzarMayorA(nroAlAzar,70)){
			res = new Calificacion("DOMINADOR",75)
		}
		if(esNroAlAzarMayorA(nroAlAzar,50)){
			res = new Calificacion("KILLING_SPREAD",60)
		}
		if(ubicacion.esUbicacionIdeal(it)){
			res = new Calificacion("MANCO",15)
		}
		res
	}
	
	def esUbicacionIdeal(Ubicacion ubicacion,Retador it){
		ubicacion.equals(personaje.ubicacionIdeal)
	}
	
	def boolean usasteAlPersonajeEnUbicacionIdealAlMenos(EstadisticasPersonajes it,Retador ret ,int veces){
		ubicacionesUsadas.filter[it.esUbicacionIdeal(ret)].size >= veces
	}
	
	def boolean usasteCualquierPersonajeEnUbicacionIdealMasDe(Retador ret, int veces){
		ret.jugador.estadisticasPersonajes.exists[usasteAlPersonajeEnUbicacionIdealAlMenos(it,ret,veces)]
	}
	
	def esNroAlAzarMayorA(int nroAzaroso ,int nro){
		nroAzaroso > nro
	}
}