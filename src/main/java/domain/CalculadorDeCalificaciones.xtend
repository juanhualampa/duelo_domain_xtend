package domain

import java.util.Random

class CalculadorDeCalificaciones {
	
	def Calificacion calcular(Retador it) {
		val nroAlAzar = new Random().nextInt(100)
		switch it{
			case cumpleConRequisitosRampage(nroAlAzar) : new Calificacion("RAMPAGE",100)
			case cumpleConRequisitosDominador(nroAlAzar) : new Calificacion("DOMINADOR",75)
			case cumpleConRequisitosKilling(nroAlAzar) : new Calificacion("KILLING_SPREAD",60)
			case cumpleConRequisitosManco : new Calificacion("MANCO",15)
			default : new Calificacion("NOOB",5)
		}
	}
	
	def cumpleConRequisitosManco(Retador it){
		ubicacion.esUbicacionIdeal(it)
	}
	
	def cumpleConRequisitosKilling(Retador it, int nroAlAzar){
		esNroAlAzarMayorA(nroAlAzar,50)
	}
		
	def boolean cumpleConRequisitosDominador(Retador it, int nroAlAzar){
		usasteCualquierPersonajeEnUbicacionIdealMasDe(2) && esNroAlAzarMayorA(nroAlAzar,70)
	}	
	
	def boolean cumpleConRequisitosRampage(Retador it, int nroAlAzar){
		estadisticas(it.personaje).usasteAlPersonajeEnUbicacionIdealAlMenos(it,5) && esNroAlAzarMayorA(nroAlAzar,90)
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