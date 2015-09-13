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
		jugador1.personajes.add(per1)
		jugador2.personajes.add(per2)
	}
		
	@Test 
	def testDosJugadoresTienenElMismoRanking(){		
		assertTrue(sis.mismoRankingSinSerElMismo(jugador1,jugador2))
		assertEquals(per1.calificacion.categoria,per2.calificacion.categoria)
	}
	
	@Test 
	def testsDosJugadoresNoTienenElMismoRanking(){
		per1.setCalificacion(new Calificacion("RAMPAGE",100))		
		assertNotEquals(per1.calificacion.categoria,per2.calificacion.categoria)
	}
	
	@Test 
	def testsDosJugadoresPeleanYSeEfectivizaEnLosDuelosDeAmbos(){
		per1.calificacion.nro = 200
		duelo = new Duelo(ret1,ret2)
		duelo.realizarse
		assertTrue(jugador1.duelos.contains(duelo))
		assertTrue(jugador2.duelos.contains(duelo))
		assertEquals(1,jugador1.duelos.size)
		assertEquals(1,jugador1.duelos.size)
		assertTrue(ret1.veredicto instanceof Ganador)
		assertTrue(ret2.veredicto instanceof Perdedor)
	}
	
}