package homes

import domain.Calificacion
import domain.EstadisticasPersonajes
import domain.Juego
import domain.Jugador
import domain.Personaje
import domain.Ubicacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
	
	List<Personaje> personajes
	List<Ubicacion> ubicacionesNoRampage
	List<Ubicacion> ubicacionesNoDominador
		
	new() {
		this.juego = new Juego
		this.top = Ubicacion.TOP
		this.bottom = Ubicacion.BOTTOM	
		this.middle = Ubicacion.MIDDLE
		this.jungle = Ubicacion.JUNGLE
		
		val amumu = new Personaje(1,"Amumu",	#["Araniar", "Llorar!"],#["La ducha"], top,'assets/images/amumu.png')
		val ahri = new Personaje(2,"Ahri", #["Ser azul", "Ser inteligente"], #["Las tijeras"], middle,'assets/images/ahri.png')
		val olaf = new Personaje(3,"Olaf", #["Tirarte cartitas","Tirar los perros"],#["Cualquier otra cosa"], middle,'assets/images/olaf.png')
		val pudge = new Personaje(4,"Pudge", #["Rayos laser","Lentes copados"],#["Cualquier otra cosa"], jungle,'assets/images/pudge.png')
		val witchdoctor = new Personaje(5,"Witchdoctor", #["Usar casco","Volar"],#["Caminar"], bottom,'assets/images/witchdoctor.png')
		val viper = new Personaje(6,"Viper", #["Ni idea","Volar"],#["Saltar"], bottom,'assets/images/viper.png')
		this.personajes = #[amumu,ahri,olaf,pudge,witchdoctor,viper]
		
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
		statsRampage = new EstadisticasPersonajes(amumu,120,80, 30, 10, 50, ubicacionesRampage, top,rampage)
		statsDominador = new EstadisticasPersonajes(pudge,12, 8, 3, 1, 5, ubicacionesNoDominador, top,dominador)
		statsKillingSpread = new EstadisticasPersonajes(ahri, 4, 1, 1, 1, 1, ubicacionesNoDominador, middle,killing_spread)
		statsManco = new EstadisticasPersonajes(witchdoctor, 10, 8, 10, 6, 5, ubicacionesNoRampage, top,manco)
		statsNoob = new EstadisticasPersonajes(olaf, 3, 0, 0, 2, 1, ubicacionesNoDominador, top,noob)
		val statsNoob2 = new EstadisticasPersonajes(viper, 4, 0, 0, 2, 1, ubicacionesNoDominador, top,noob)	
		
		//AGREGO PERSONAJES JUGADOR UNO
		val statsJugadorUno = #[statsRampage,statsDominador,statsKillingSpread,statsManco,statsNoob,statsNoob2]
		
		//STATS PERSONAJES JUGADOR DOS
		statsRampageDos = new EstadisticasPersonajes(olaf,80, 60, 20, 10, 15, ubicacionesRampage, top, rampage)
		statsDominadorDos = new EstadisticasPersonajes(ahri, 15, 8, 4, 2, 6, ubicacionesNoDominador, top, dominador)
		statsKillingSpreadDos = new EstadisticasPersonajes(pudge, 5, 2, 3, 0, 1, ubicacionesNoDominador, middle, killing_spread)
//		statsMancoDos = new EstadisticasPersonajes(witchdoctor,10,8, 10, 6, 5, ubicacionesNoRampage, top, manco)
		statsNoobDos = new EstadisticasPersonajes(amumu, 4, 3, 1, 2, 1, ubicacionesNoDominador, top, noob)
		
		//AGREGO PERSONAJES JUGADOR DOS
		val statsJugadorDos = #[statsRampageDos,statsDominadorDos,statsKillingSpreadDos,statsNoobDos]
		
		//STATS PERSONAJES JUGADOR TRES
		statsRampageTres = new EstadisticasPersonajes(pudge, 35, 30, 25, 4, 1, ubicacionesRampage, top,rampage)
		statsDominadorTres = new EstadisticasPersonajes(amumu, 25, 15, 13, 2, 2, ubicacionesNoDominador, top,dominador)
		statsKillingSpreadTres = new EstadisticasPersonajes(ahri, 15, 10, 8, 1, 1, ubicacionesNoDominador, middle,killing_spread)
//		statsMancoTres = new EstadisticasPersonajes(witchdoctor,10,8, 10, 6, 5, ubicacionesNoRampage, top, manco)
		statsNoobTres = new EstadisticasPersonajes(olaf, 2, 1, 0, 1, 0, ubicacionesNoDominador, top, noob)
		
		//AGREGO PERSONAJES JUGADOR DOS
		val statsJugadorTres = #[statsRampageTres,statsDominadorTres,statsKillingSpreadTres,statsNoobTres]
		
		//ASIGNO STATS A LOS JUGADORES
		this.jugadorUno = new Jugador(1,"Luciano",statsJugadorUno)
		this.jugadorDos = new Jugador(2,"Juan",statsJugadorDos)
		this.jugadorTres = new Jugador(3,"Guido",statsJugadorTres)
		
		//REGISTRO A LOS JUGADORES EN EL JUEGO
		jugadorUno.registrarEn(juego)
		jugadorDos.registrarEn(juego)
		jugadorTres.registrarEn(juego)		
	}
	
	def jugadorSeleccionado(){
		jugadorUno
	}
		
	def estadisticas(Integer idJugador){
		juego.jugadores.findFirst[it.id.equals(idJugador)].estadisticasPersonajes
	}
	
	def estadisticasDePersonajeSeleccionado(Integer idJugador,Integer idPersonaje){
		estadisticas(idJugador).findFirst[personaje.id.equals(idPersonaje)]
	}
		
	def caracteristicas(Integer idPersonaje){
		val personaje =personajes.findFirst[id.equals(idPersonaje)]
		#[personaje.especialidades,personaje.debilidades,personaje.ubicacionIdeal]
	}
		
	def jugador(){
		jugadorUno
	}
		
}