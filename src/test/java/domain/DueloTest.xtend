package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList
import java.util.Arrays

class DueloTest {
	Jugador jugador1
	Jugador jugador2
	Sistema sis
	Ubicacion ubi1
	Ubicacion ubi2		
	Personaje per1 
	Personaje per2
	Retador ret1 
	Retador ret2 
	EstadisticasPersonajes est1
	EstadisticasPersonajes est2
	
	
	@Before
	def void setUp() {
		this.sis = new Sistema()	
		this.ubi1 = Ubicacion.TOP;
		this.ubi2 = Ubicacion.BOTTOM;	
		this.per1 = new Personaje("Wolverine", Arrays.asList("Araniar", "Llorar!"),
			Arrays.asList("La ducha"),ubi1)
		this.per2 = new Personaje("Gambito", Arrays.asList("Tirarte cartitas","Tirar los perros"),Arrays.asList("Cualquier otra cosa"),Ubicacion.MIDDLE)
		
		val calGanadora = new Calificacion("RAMPAGE",100)
		val calPerdedora = new Calificacion("NOOB",5)
		
		val ubicacionesUsadas = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(ubi1,ubi2,ubi1,ubi2))
		
		val ubicacionesUsadas2 = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(ubi1,ubi2))
		
		est1 = new EstadisticasPersonajes(per1,10,4, 3, 1, 5, ubicacionesUsadas, ubi1,calGanadora)
		est2 = new EstadisticasPersonajes(per2,4,1, 1, 1, 1, ubicacionesUsadas2, ubi1,calPerdedora)
		
		val estadisticasPersonajesParaGanador = new ArrayList<EstadisticasPersonajes>()
		estadisticasPersonajesParaGanador.add(est1)
		estadisticasPersonajesParaGanador.add(est2)
		
		val estadisticasPersonajesParaPerdedor = new ArrayList<EstadisticasPersonajes>()
		estadisticasPersonajesParaPerdedor.add(est2)
		
		this.jugador1 = new Jugador("Luciano",estadisticasPersonajesParaGanador )
		this.jugador2 = new Jugador("Juan",estadisticasPersonajesParaPerdedor)
		jugador1.setSistema(sis)
		jugador2.setSistema(sis)
		this.ret1 = new Retador(jugador1, per1,ubi1,new Iniciador)
		this.ret2 = new Retador(jugador2, per2, ubi2,new NoIniciador)
	}
		
	@Test 
	def testDosJugadoresTienenElMismoRanking(){		
		assertTrue(sis.mismoRankingSinSerElMismo(jugador1,jugador2))
		assertEquals(jugador1.calificacion,jugador2.calificacion)
		
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
		assertEquals(0,jugador1.duelos.size)
		jugador1.iniciarDuelo(per1,ubi1)
		assertEquals(1,jugador1.duelos.size)
		val veredictoParaElJugador1 = jugador1.duelos.get(0).retador.veredicto
		val veredictoParaElJugador2 = jugador1.duelos.get(0).retado.veredicto
		assertTrue(veredictoParaElJugador1 instanceof Ganador)
		assertTrue(veredictoParaElJugador2 instanceof Perdedor)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){		
		assertEquals(0,jugador2.duelos.size)
		jugador2.iniciarDuelo(per2,ubi1)
		assertEquals(1,jugador2.duelos.size)
		val veredictoParaElJugador2 = jugador2.duelos.get(0).retador.veredicto
		val veredictoParaElJugador1 = jugador2.duelos.get(0).retado.veredicto
		assertTrue(veredictoParaElJugador2 instanceof Perdedor)
		assertTrue(veredictoParaElJugador1 instanceof Ganador)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		
		assertEquals(0,jugador1.duelos.size)
		jugador1.iniciarDuelo(per2,ubi1)
		assertEquals(1,jugador1.duelos.size)
		val veredictoParaElJugador1 = jugador1.duelos.get(0).retador.veredicto
		val veredictoParaElJugador2 = jugador1.duelos.get(0).retado.veredicto
		assertTrue(veredictoParaElJugador1 instanceof Empate)
		assertTrue(veredictoParaElJugador2 instanceof Empate)
	}
	
}