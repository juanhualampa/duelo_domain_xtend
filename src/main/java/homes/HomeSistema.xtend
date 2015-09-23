package homes

import java.util.List
import java.util.ArrayList
import domain.Ubicacion
import java.util.Arrays
import domain.Personaje
import domain.Calificacion
import domain.EstadisticasPersonajes
import domain.Sistema
import domain.Jugador

class HomeSistema {
	
	Jugador jugador1
	Jugador jugador2
	Jugador jugador3
	Sistema sis
	Ubicacion top
	Ubicacion bottom		
	Ubicacion jungle
	Ubicacion middle
	Personaje wolverine 
	Personaje gambito
	Personaje ciclope	
	Personaje bestia
	EstadisticasPersonajes estadisticasDeUnRampage
	EstadisticasPersonajes estadisticasDeUnNoob	
	EstadisticasPersonajes estadisticaDeUnDominador
	EstadisticasPersonajes estadisticasDeUnKillingSpread
	Calificacion rampage
	Calificacion killing_spread 
	Calificacion noob 
	Calificacion dominador
	EstadisticasPersonajes estadisticasDeOtroRampage
	List<Ubicacion> ubicacionesNoRampage
	List<Ubicacion> ubicacionesNoDominador
		
	new() {
		this.sis = new Sistema
		this.top = Ubicacion.TOP
		this.bottom = Ubicacion.BOTTOM	
		this.middle = Ubicacion.MIDDLE
		this.jungle = Ubicacion.JUNGLE
		this.wolverine = new Personaje("Wolverine", Arrays.asList("Araniar", "Llorar!"),
			Arrays.asList("La ducha"),top)
		this.bestia = new Personaje("Bestia",Arrays.asList("Ser azul", "Ser inteligente"),
			Arrays.asList("Las tijeras"),middle)
		this.gambito = new Personaje("Gambito", Arrays.asList("Tirarte cartitas","Tirar los perros"),Arrays.asList("Cualquier otra cosa"),Ubicacion.MIDDLE)
		this.ciclope = new Personaje("Ciclope", Arrays.asList("Rayos laser","Lentes copados"),Arrays.asList("Cualquier otra cosa"),Ubicacion.JUNGLE)
		
		val ubicacionesRampage = new ArrayList<Ubicacion>
		ubicacionesRampage.addAll(Arrays.asList(top,top,top,top,top,bottom))
		
		ubicacionesNoRampage = new ArrayList<Ubicacion>
		ubicacionesNoRampage.addAll(Arrays.asList(top,jungle,top,middle))
		
		ubicacionesNoDominador = new ArrayList<Ubicacion>
		ubicacionesNoDominador.addAll(Arrays.asList(top,jungle,bottom,middle))
		
		
		rampage = new Calificacion("RAMPAGE",100)
		killing_spread = new Calificacion("KILLING_SPREAD",60)
		noob = new Calificacion("NOOB",5)
		dominador = new Calificacion("DOMINADOR",80)
		
		
		estadisticasDeUnRampage = new EstadisticasPersonajes(wolverine,120,80, 30, 10, 50, ubicacionesRampage, top,rampage)
		estadisticasDeUnNoob = new EstadisticasPersonajes(gambito,4,1, 1, 1, 1, ubicacionesNoDominador, top,noob)		
		estadisticaDeUnDominador = new EstadisticasPersonajes(ciclope,12,8, 3, 1, 5, ubicacionesNoDominador, top,dominador)
		estadisticasDeUnKillingSpread = new EstadisticasPersonajes(bestia,4,1, 1, 1, 1, ubicacionesNoDominador, middle,killing_spread)
		estadisticasDeOtroRampage = new EstadisticasPersonajes(wolverine,30,18, 10, 6, 5, ubicacionesNoRampage, top,rampage)
				
		val estadisticasPersonajesParaGanador = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaGanador.add(estadisticasDeUnRampage)
		estadisticasPersonajesParaGanador.add(estadisticaDeUnDominador)
		
		val estadisticasPersonajesParaPerdedor = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnNoob)
		estadisticasPersonajesParaPerdedor.add(estadisticasDeOtroRampage)
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnKillingSpread)
		
		val estadisticasPersonajesParaEmpatar = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaEmpatar.add(estadisticaDeUnDominador)
		
		this.jugador1 = new Jugador("Luciano",estadisticasPersonajesParaGanador)
		this.jugador2 = new Jugador("Juan",estadisticasPersonajesParaPerdedor)
		this.jugador3 = new Jugador("Guido",estadisticasPersonajesParaEmpatar)
		
		jugador1.setSistema(sis)
		jugador2.setSistema(sis)
		jugador3.setSistema(sis)		
	}
		
	def jugador(){
		jugador1
	}
		
}