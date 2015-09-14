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
		this.est1 = new EstadisticasPersonajes(per1)
		this.est2 = new EstadisticasPersonajes(per2)
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
		est1.calificacion.nro = 200		
		sis.oponentePorDefecto = ret2
		jugador1.agregarEstadistica(est1)
		ret2.jugador.agregarEstadistica(est2)
		assertEquals(0,jugador1.duelos.size)
		jugador1.iniciarDuelo(per1,Ubicacion.MIDDLE)
		assertEquals(1,jugador1.duelos.size)
		val veredictoParaElJugador1 = jugador1.duelos.get(0).retador.veredicto
		assertTrue(veredictoParaElJugador1 instanceof Ganador)
		assertTrue(ret2.veredicto instanceof Perdedor)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){
		est2.calificacion.nro = 2300		
		sis.oponentePorDefecto = ret2
		ret2.jugador.agregarEstadistica(est2)
		assertEquals(0,jugador1.duelos.size)
		jugador1.iniciarDuelo(per1,Ubicacion.MIDDLE)
		assertEquals(1,jugador1.duelos.size)
		val veredictoParaElJugador1 = jugador1.duelos.get(0).retador.veredicto
		assertTrue(veredictoParaElJugador1 instanceof Perdedor)
		assertTrue(ret2.veredicto instanceof Ganador)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		sis.oponentePorDefecto = ret2
		ret2.jugador.agregarEstadisticaPara(per2)
		assertEquals(0,jugador1.duelos.size)
		jugador1.iniciarDuelo(per1,Ubicacion.MIDDLE)
		assertEquals(1,jugador1.duelos.size)
		val veredictoParaElJugador1 = jugador1.duelos.get(0).retador.veredicto
		assertTrue(veredictoParaElJugador1 instanceof Empate)
		assertTrue(ret2.veredicto instanceof Empate)
	}
	
}