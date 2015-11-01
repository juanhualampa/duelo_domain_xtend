package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList
import java.util.Arrays
import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import veredicto.ActualizadorGanador
import veredicto.ActualizadorEmpate
import veredicto.ActualizadorPerdedor
import resultado.Victoria
import resultado.Derrota
import resultado.Empate

class DueloTest {
	Jugador jugadorGanador
	Jugador jugadorPerdedor
	Jugador jugadorQueEmpata1
	Jugador jugadorQueEmpata2	
	Juego sis
	Ubicacion top
	Ubicacion bottom		
	Ubicacion jungle
	Ubicacion middle
	Personaje wolverine 
	Personaje gambito
	Personaje ciclope	
	Personaje bestia
	Retador retadorQueGana 
	Retador retadorQuePierde 
	Retador retadorQueEmpata
	EstadisticasPersonajes estadisticasDeUnRampage
	EstadisticasPersonajes estadisticasDeUnNoob	
	EstadisticasPersonajes estadisticaDeUnDominador
	EstadisticasPersonajes estadisticasDeUnKillingSpread
	
	EstadisticasPersonajes estadisticasDeOtroRampage
	
	
	@Before
	def void setUp() {
		this.sis = new Juego
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
		
		val rampage = new Calificacion("RAMPAGE",100)
		val killing_spread = new Calificacion("KILLING_SPREAD",60)
		val calPerdedora = new Calificacion("NOOB",5)
		val dominador = new Calificacion("DOMINADOR",80)
		
		val ubicacionesUsadas = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(top,bottom,top,bottom))
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(top,bottom))
		
		estadisticasDeUnRampage = new EstadisticasPersonajes(wolverine,120,80, 30, 10, 50, ubicacionesUsadas, top,rampage)
		estadisticasDeUnNoob = new EstadisticasPersonajes(gambito,4,1, 1, 1, 1, ubicacionesUsadas2, top,calPerdedora)		
		estadisticaDeUnDominador = new EstadisticasPersonajes(ciclope,12,8, 3, 1, 5, ubicacionesUsadas2, top,dominador)
		estadisticasDeUnKillingSpread = new EstadisticasPersonajes(bestia,4,1, 1, 1, 1, ubicacionesUsadas2, middle,killing_spread)
		estadisticasDeOtroRampage = new EstadisticasPersonajes(wolverine,30,18, 10, 6, 5, ubicacionesUsadas, top,rampage)
				
		val estadisticasPersonajesParaGanador = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaGanador.add(estadisticasDeUnRampage)
		estadisticasPersonajesParaGanador.add(estadisticaDeUnDominador)
		
		val estadisticasPersonajesParaPerdedor = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnNoob)
		estadisticasPersonajesParaPerdedor.add(estadisticasDeOtroRampage)
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnKillingSpread)
		
		val estadisticasPersonajesParaEmpatar = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaEmpatar.add(estadisticaDeUnDominador)
		
		this.jugadorGanador = new Jugador("Luciano",estadisticasPersonajesParaGanador)
		this.jugadorPerdedor = new Jugador("Juan",estadisticasPersonajesParaPerdedor)
		this.jugadorQueEmpata1 = new Jugador("Guido",estadisticasPersonajesParaEmpatar)
		
		jugadorGanador.registrarEn(sis)
		jugadorPerdedor.registrarEn(sis)
		jugadorQueEmpata1.registrarEn(sis)
		
	}
		
	
	
	/*
	@Test 
	def testsDosJugadoresNoTienenElMismoRanking(){
		
		est1.setCalificacion(new Calificacion("RAMPAGE",100))
		
		 * Juan mirate lo de las calificaciones con el Ranking
		 
		//assertNotEquals(jugador1.calificacion,jugador2.calificacion)	
		assertNotEquals(est1.calificacion.categoria,est2.calificacion.categoria)
	}
	
	*/
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElPrimero(){
		assertEquals(0,jugadorGanador.duelos.size)
		jugadorGanador.iniciarDuelo(wolverine,middle)
		assertEquals(1,jugadorGanador.duelos.size)
		val resultadoJugador1 = jugadorGanador.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Victoria)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){		
		assertEquals(0,jugadorPerdedor.duelos.size)
		jugadorPerdedor.iniciarDuelo(gambito,middle)
		assertEquals(1,jugadorPerdedor.duelos.size)
		val resultadoJugador1 = jugadorPerdedor.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Derrota)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		
		assertEquals(0,jugadorGanador.duelos.size)
		jugadorGanador.iniciarDuelo(ciclope,top)
		assertEquals(1,jugadorGanador.duelos.size)
		val resultadoJugador1 = jugadorGanador.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Empate)
	}
	
}