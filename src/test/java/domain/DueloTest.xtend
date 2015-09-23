package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList
import java.util.Arrays
import retador.Retador
import retador.Iniciador
import retador.NoIniciador
import veredicto.Ganador
import veredicto.Perdedor
import veredicto.Empate

class DueloTest {
	Jugador jugadorGanador
	Jugador jugadorPerdedor
	Jugador jugadorQueEmpata1
	Jugador jugadorQueEmpata2	
	Sistema sis
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
	EstadisticasPersonajes otraEstadisticaDeUnRampage
	EstadisticasPersonajes estadisticasDeUnKillingSpread		
	
	
	@Before
	def void setUp() {
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
		
		val rampage = new Calificacion("RAMPAGE",100)
		val killing_spread = new Calificacion("KILLING_SPREAD",60)
		val calPerdedora = new Calificacion("NOOB",5)
		
		val ubicacionesUsadas = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(top,bottom,top,bottom))
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(top,bottom))
		
		estadisticasDeUnRampage = new EstadisticasPersonajes(wolverine,120,80, 30, 10, 50, ubicacionesUsadas, top,rampage)
		estadisticasDeUnNoob = new EstadisticasPersonajes(gambito,4,1, 1, 1, 1, ubicacionesUsadas2, top,calPerdedora)		
		otraEstadisticaDeUnRampage = new EstadisticasPersonajes(ciclope,120,80, 30, 10, 50, ubicacionesUsadas2, top,rampage)
		estadisticasDeUnKillingSpread = new EstadisticasPersonajes(bestia,4,1, 1, 1, 1, ubicacionesUsadas2, top,killing_spread)
		
				
		val estadisticasPersonajesParaGanador = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaGanador.add(estadisticasDeUnRampage)
		estadisticasPersonajesParaGanador.add(estadisticasDeUnKillingSpread)
		
		val estadisticasPersonajesParaPerdedor = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnNoob)
		estadisticasPersonajesParaPerdedor.add(estadisticasDeUnKillingSpread)
		
		val estadisticasPersonajesParaEmpatar = new ArrayList<EstadisticasPersonajes>
		estadisticasPersonajesParaEmpatar.add(otraEstadisticaDeUnRampage)
		
		this.jugadorGanador = new Jugador("Luciano",estadisticasPersonajesParaGanador)
		this.jugadorPerdedor = new Jugador("Juan",estadisticasPersonajesParaPerdedor)
		this.jugadorQueEmpata1 = new Jugador("Guido",estadisticasPersonajesParaEmpatar)
		
		jugadorGanador.setSistema(sis)
		jugadorPerdedor.setSistema(sis)
		jugadorQueEmpata1.setSistema(sis)
		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,top)
		this.retadorQuePierde = new NoIniciador(jugadorPerdedor, gambito, bottom)
		this.retadorQueEmpata = new NoIniciador(jugadorQueEmpata1, bestia, bottom)
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
		this.retadorQuePierde = new NoIniciador(jugadorPerdedor, gambito, bottom)
		assertEquals(0,jugadorGanador.duelos.size)
		jugadorGanador.iniciarDuelo(wolverine,top)
		assertEquals(1,jugadorGanador.duelos.size)
		val veredictoParaElJugador1 = jugadorGanador.duelos.get(0).resultado.v1
		val veredictoParaElJugador2 = jugadorGanador.duelos.get(0).resultado.v2
		assertTrue(veredictoParaElJugador1 instanceof Ganador)
		assertTrue(veredictoParaElJugador2 instanceof Perdedor)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){		
		assertEquals(0,jugadorPerdedor.duelos.size)
		jugadorPerdedor.iniciarDuelo(ciclope,top)
		assertEquals(1,jugadorPerdedor.duelos.size)
		val veredictoParaElJugador2 = jugadorPerdedor.duelos.get(0).resultado.v1
		val veredictoParaElJugador1 = jugadorPerdedor.duelos.get(0).resultado.v2
		assertTrue(veredictoParaElJugador2 instanceof Perdedor)
		assertTrue(veredictoParaElJugador1 instanceof Ganador)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		
		assertEquals(0,jugadorGanador.duelos.size)
		jugadorGanador.iniciarDuelo(gambito,top)
		assertEquals(1,jugadorGanador.duelos.size)
		val veredictoParaElJugador1 = jugadorGanador.duelos.get(0).resultado.v1
		val veredictoParaElJugador2 = jugadorGanador.duelos.get(0).resultado.v2
		assertTrue(veredictoParaElJugador1 instanceof Empate)
		assertTrue(veredictoParaElJugador2 instanceof Empate)
	}
	
}