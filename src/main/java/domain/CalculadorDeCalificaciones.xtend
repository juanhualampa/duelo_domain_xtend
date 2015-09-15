package domain

import java.util.List

class CalculadorDeCalificaciones {
	
	def Calificacion calcular(Retador it, int nroAlAzar) {
		switch it{
			case cumpleConRequisitosRampage(nroAlAzar) : new Calificacion("RAMPAGE",100)
			case cumpleConRequisitosDominador(nroAlAzar) : new Calificacion("DOMINADOR",75)
			case cumpleConRequisitosKilling(nroAlAzar) : new Calificacion("KILLING_SPREAD",60)
			case cumpleConRequisitosManco(nroAlAzar) : new Calificacion("MANCO",15)
			default : new Calificacion("NOOB",5)
		}
	}
	
	def boolean cumpleConRequisitosRampage(Retador it, int nroAlAzar){
		/*
		 * Asumi que lo que me piden son las estadisticas de todos los duelos con este personaje
		 * (me fijo si son al menos 5 en la posIdeal del personaje que uso el retador)
		 */
		 jugador.duelos.hayDuelosConPersonajeYUbicacionIdealEnAlMenos(jugador,personaje,5) &&
		esNroAlAzarMayorA(nroAlAzar,90)
	}
	
	def boolean hayDuelosConPersonajeYUbicacionIdealEnAlMenos(List<Duelo> duelos, Jugador j, Personaje personaje, int veces){
		duelos.filter[it.conEsteJugadorYPersonajeEnUbicacionIdeal(j,personaje)].size >= veces
	}
	
	def boolean conEsteJugadorYPersonajeEnUbicacionIdeal(Duelo duelo, Jugador jugador, Personaje personaje) {
		duelo.retador.conEsteJugadorYPersonajeEnUbicacionIdeal(jugador,personaje) ||
		duelo.retado.conEsteJugadorYPersonajeEnUbicacionIdeal(jugador,personaje) 
	}
	
	def boolean conEsteJugadorYPersonajeEnUbicacionIdeal(Retador ret, Jugador j, Personaje p ){
		ret.jugador.equals(j) && ret.personaje.equals(p) && ret.ubicacion.equals(p.ubicacionIdeal)
	}
	
	
	def cumpleConRequisitosManco(Retador it, int nroAlAzar){
		ubicacion.esUbicacionIdeal(it) && esNroAlAzarMayorA(nroAlAzar,30)
	}
	
	def cumpleConRequisitosKilling(Retador it, int nroAlAzar){
		esNroAlAzarMayorA(nroAlAzar,50)
	}
		
	def boolean cumpleConRequisitosDominador(Retador it, int nroAlAzar){
		/*
		 * Esto pasa cuando el jugador tiene experiencia previa 
		 * (de al menos dos duelos) jugando con este u otros personajes en la posición ideal 
		 * para este y además sacó un numero al azar > a 70
		 */
		usasteCualquierPersonajeEnUbicacionIdealMasDe(2) && esNroAlAzarMayorA(nroAlAzar,70)
	}	
	
	def boolean hayDuelosConCualquierPesonajeYUbicacionIdealEnAlMenos(List<Duelo> duelos, Jugador j,  int veces){
		j.estadisticasPersonajes.map[it.personaje].exists[hayDuelosConPersonajeYUbicacionIdealEnAlMenos(duelos,j,it,veces)]
	}
		 
	def esUbicacionIdeal(Ubicacion ubicacion,Retador it){
		ubicacion.equals(personaje.ubicacionIdeal)
	}
	
	def boolean usasteAlPersonajeEnUbicacionIdealAlMenos(EstadisticasPersonajes it,Retador ret ,int veces){
		ubicacionesUsadas.filter[it.esUbicacionIdeal(ret)].size >= veces
	}
	
	def boolean usasteCualquierPersonajeEnUbicacionIdealMasDe(Retador it, int veces){
		hayDuelosConCualquierPesonajeYUbicacionIdealEnAlMenos(jugador.duelos,jugador,veces)
	}
	
	def esNroAlAzarMayorA(int nroAzaroso ,int nro){
		nroAzaroso > nro
	}
}