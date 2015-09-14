package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*


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
	Duelo duelo
	EstadisticasPersonajes est1
	EstadisticasPersonajes est2
	
	
	@Before
	def void setUp() {
		this.sis = new Sistema()		
		this.jugador1 = new Jugador("Luciano",sis)
		this.jugador2 = new Jugador("Juan",sis)
		this.ubi1 = Ubicacion.TOP;
		this.ubi2 = Ubicacion.BOTTOM;
		this.per1 = new Personaje("Wolverine","Araniar","La ducha",Ubicacion.BOTTOM)
		this.per2 = new Personaje("Gambito","Tirarte cartitas","Ni idea",Ubicacion.MIDDLE)
		this.ret1 = new Retador(jugador1, per1,ubi1,new Iniciador)
		this.ret2 = new Retador(jugador2, per2, ubi2,new NoIniciador)
		this.est1= new EstadisticasPersonajes(per1)
		this.est2= new EstadisticasPersonajes(per2)
		jugador1.getEstadisticasPersonajes.add(est1)
		jugador2.getEstadisticasPersonajes.add(est2)
	}
		
	@Test 
	def testDosJugadoresTienenElMismoRanking(){		
		assertTrue(sis.mismoRankingSinSerElMismo(jugador1,jugador2))
		assertEquals(jugador1.calificacion,jugador2.calificacion)
		assertEquals(est1.calificacion.categoria,est2.calificacion.categoria)
		
	}
	
	@Test 
	def testsDosJugadoresNoTienenElMismoRanking(){
		est1.setCalificacion(new Calificacion("RAMPAGE",100))
		/*
		 * Juan mirate lo de las calificaciones
		 */	
		//assertNotEquals(jugador1.calificacion,jugador2.calificacion)	
		//assertNotEquals(est1.calificacion.categoria,est2.calificacion.categoria)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElPrimero(){
		est1.calificacion.nro = 200
		duelo = new Duelo(ret1,ret2)
		duelo.realizarse
		assertTrue(jugador1.duelos.contains(duelo))
		assertTrue(jugador2.duelos.contains(duelo))
		assertEquals(1,jugador1.duelos.size)
		assertEquals(1,jugador2.duelos.size)
		assertTrue(ret1.veredicto instanceof Ganador)
		assertTrue(ret2.veredicto instanceof Perdedor)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){
		est2.calificacion.nro = 2300
		duelo = new Duelo(ret1,ret2)
		duelo.realizarse
		assertTrue(jugador1.duelos.contains(duelo))
		assertTrue(jugador2.duelos.contains(duelo))
		assertEquals(1,jugador1.duelos.size)
		assertEquals(1,jugador2.duelos.size)
		assertTrue(ret1.veredicto instanceof Perdedor)
		assertTrue(ret2.veredicto instanceof Ganador)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		duelo = new Duelo(ret1,ret2)
		duelo.realizarse
		assertTrue(jugador1.duelos.contains(duelo))
		assertTrue(jugador2.duelos.contains(duelo))
		assertEquals(1,jugador1.duelos.size)
		assertEquals(1,jugador2.duelos.size)
		assertTrue(ret1.veredicto instanceof Empate)
		assertTrue(ret2.veredicto instanceof Empate)
	}
	
}