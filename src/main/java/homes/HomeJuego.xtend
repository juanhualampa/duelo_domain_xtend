package homes

import java.util.List
import java.util.ArrayList
import domain.Ubicacion
import java.util.Arrays
import domain.Personaje
import domain.Calificacion
import domain.EstadisticasPersonajes
import domain.Jugador
import domain.Juego

class HomeJuego {
	
	Juego juego
	//JUGADORES
	Jugador jugadorUno
	Jugador jugadorDos
	Jugador jugadorTres
	//UBICACIONES
	Ubicacion top
	Ubicacion bottom		
	Ubicacion jungle
	Ubicacion middle
	//PERSONAJES
	Personaje wolverine 
	Personaje gambito
	Personaje ciclope	
	Personaje bestia
	Personaje magneto
	
	//STATS PERSONAJES
	EstadisticasPersonajes statsRampage
	EstadisticasPersonajes statsDominador
	EstadisticasPersonajes statsKillingSpread
	EstadisticasPersonajes statsManco
	EstadisticasPersonajes statsNoob
	
	EstadisticasPersonajes statsRampageDos
	EstadisticasPersonajes statsDominadorDos
	EstadisticasPersonajes statsKillingSpreadDos
	EstadisticasPersonajes statsMancoDos
	EstadisticasPersonajes statsNoobDos
	
	EstadisticasPersonajes statsRampageTres
	EstadisticasPersonajes statsDominadorTres
	EstadisticasPersonajes statsKillingSpreadTres
	EstadisticasPersonajes statsMancoTres
	EstadisticasPersonajes statsNoobTres
	
	//CALIFICACIONES PERSONAJES
	Calificacion rampage
	Calificacion killing_spread 
	Calificacion noob
	Calificacion manco
	Calificacion dominador
	
	List<Ubicacion> ubicacionesNoRampage
	List<Ubicacion> ubicacionesNoDominador
		
	new() {
		this.juego = new Juego
		this.top = Ubicacion.TOP
		this.bottom = Ubicacion.BOTTOM	
		this.middle = Ubicacion.MIDDLE
		this.jungle = Ubicacion.JUNGLE
		
		this.wolverine = new Personaje("Wolverine",	#["Araniar", "Llorar!"],#["La ducha"], top
		)
		this.bestia = new Personaje("Bestia", #["Ser azul", "Ser inteligente"], #["Las tijeras"], middle)
		this.gambito = new Personaje("Gambito", #["Tirarte cartitas","Tirar los perros"],#["Cualquier otra cosa"], middle)
		this.ciclope = new Personaje("Ciclope", #["Rayos laser","Lentes copados"],#["Cualquier otra cosa"], jungle)
		this.magneto = new Personaje("Magneto", #["Usar casco","Volar"],#["Caminar"], bottom)
		
		//UBICACIONES
		val ubicacionesRampage = #[top,top,top,top,top,bottom]
		
		ubicacionesNoRampage = #[top,jungle,top,middle]
		
		ubicacionesNoDominador = #[top,jungle,bottom,middle]
		
		//CALIFICACIONES SETEADAS PARA EVITAR RANDOM
		rampage = new Calificacion("RAMPAGE",100)
		dominador = new Calificacion("DOMINADOR",80)
		killing_spread = new Calificacion("KILLING_SPREAD",60)
		manco = new Calificacion("MANCO",40)
		noob = new Calificacion("NOOB",5)
		
		//STATS PERSONAJES JUGADOR UNO
		//NO HAY RIVAL PARA PERSONAJE EN MANCO
		statsRampage = new EstadisticasPersonajes(wolverine,120,80, 30, 10, 50, ubicacionesRampage, top,rampage)
		statsDominador = new EstadisticasPersonajes(ciclope,12, 8, 3, 1, 5, ubicacionesNoDominador, top,dominador)
		statsKillingSpread = new EstadisticasPersonajes(bestia, 4, 1, 1, 1, 1, ubicacionesNoDominador, middle,killing_spread)
		statsManco = new EstadisticasPersonajes(magneto, 10, 8, 10, 6, 5, ubicacionesNoRampage, top,manco)
		statsNoob = new EstadisticasPersonajes(gambito, 3, 0, 0, 2, 1, ubicacionesNoDominador, top,noob)	
		
		//AGREGO PERSONAJES JUGADOR UNO
		val statsJugadorUno = #[statsRampage,statsDominador,statsKillingSpread,statsManco,statsNoob]
		
		//STATS PERSONAJES JUGADOR DOS
		statsRampageDos = new EstadisticasPersonajes(gambito,80, 60, 20, 10, 15, ubicacionesRampage, top, rampage)
		statsDominadorDos = new EstadisticasPersonajes(bestia, 15, 8, 4, 2, 6, ubicacionesNoDominador, top, dominador)
		statsKillingSpreadDos = new EstadisticasPersonajes(ciclope, 5, 2, 3, 0, 1, ubicacionesNoDominador, middle, killing_spread)
//		statsMancoDos = new EstadisticasPersonajes(magneto,10,8, 10, 6, 5, ubicacionesNoRampage, top, manco)
		statsNoobDos = new EstadisticasPersonajes(wolverine, 4, 3, 1, 2, 1, ubicacionesNoDominador, top, noob)
		
		//AGREGO PERSONAJES JUGADOR DOS
		val statsJugadorDos = #[statsRampageDos,statsDominadorDos,statsKillingSpreadDos,statsNoobDos]
		
		//STATS PERSONAJES JUGADOR TRES
		statsRampageTres = new EstadisticasPersonajes(ciclope, 35, 30, 25, 4, 1, ubicacionesRampage, top,rampage)
		statsDominadorTres = new EstadisticasPersonajes(wolverine, 25, 15, 13, 2, 2, ubicacionesNoDominador, top,dominador)
		statsKillingSpreadTres = new EstadisticasPersonajes(bestia, 15, 10, 8, 1, 1, ubicacionesNoDominador, middle,killing_spread)
//		statsMancoTres = new EstadisticasPersonajes(magneto,10,8, 10, 6, 5, ubicacionesNoRampage, top, manco)
		statsNoobTres = new EstadisticasPersonajes(gambito, 2, 1, 0, 1, 0, ubicacionesNoDominador, top, noob)
		
		//AGREGO PERSONAJES JUGADOR DOS
		val statsJugadorTres = #[statsRampageTres,statsDominadorTres,statsKillingSpreadTres,statsNoobTres]
		
		//ASIGNO STATS A LOS JUGADORES
		this.jugadorUno = new Jugador("Luciano",statsJugadorUno)
		this.jugadorDos = new Jugador("Juan",statsJugadorDos)
		this.jugadorTres = new Jugador("Guido",statsJugadorTres)
		
		//REGISTRO A LOS JUGADORES EN EL JUEGO
		jugadorUno.registrarEn(juego)
		jugadorDos.registrarEn(juego)
		jugadorTres.registrarEn(juego)		
	}
	
		
	def posiciones(){
		return #[Ubicacion.TOP,Ubicacion.BOTTOM,Ubicacion.MIDDLE, Ubicacion.JUNGLE]
	}
		
	def jugador(){
		jugadorUno
	}
		
}