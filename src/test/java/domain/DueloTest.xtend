package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import resultado.Victoria
import resultado.Derrota
import resultado.Empate
import homes.HomeJuego

class DueloTest {
	Jugador unJugador
	Jugador otroJugador
	Jugador jugadorQueEmpata
	HomeJuego home
	
	@Before
	def void setUp() {
		this.home= new HomeJuego
		this.unJugador = this.home.jugadorSeleccionado
		this.otroJugador = this.home.otroJugador
		this.jugadorQueEmpata = this.home.tercerJugador
	}
		
	@Test 
	def testsDosJugadoresTienenElMismoRanking(){
		val est1 = new EstadisticasPersonajes()
		val est2 = new EstadisticasPersonajes()
		est1.setCalificacion(new Calificacion("RAMPAGE",100))
		est2.setCalificacion(new Calificacion("RAMPAGE",100))	
		assertEquals(est1.calificacion.categoria,est2.calificacion.categoria)
	}
	
	@Test 
	def testsDosJugadoresNoTienenElMismoRanking(){
		val est1 = new EstadisticasPersonajes()
		val est2 = new EstadisticasPersonajes()
		est1.setCalificacion(new Calificacion("RAMPAGE",100))
		est2.setCalificacion(new Calificacion("DOMINADOR",80))	
		assertNotEquals(est1.calificacion.categoria,est2.calificacion.categoria)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElPrimero(){
		assertEquals(0,unJugador.duelos.size)
		unJugador.iniciarDuelo(this.home.amumu,Ubicacion.MIDDLE)
		assertEquals(1,unJugador.duelos.size)
		val resultadoJugador1 = unJugador.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Victoria)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConVictoriaParaElSegundo(){		
		assertEquals(0,otroJugador.duelos.size)
		otroJugador.iniciarDuelo(this.home.olaf,Ubicacion.MIDDLE)
		assertEquals(1,otroJugador.duelos.size)
		val resultadoJugador1 = otroJugador.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Derrota)
	}
	
	@Test 
	def testsDosRetadoresPeleanYSeEfectivizaEnLosDuelosDeAmbosConEmpate(){
		
		assertEquals(0,unJugador.duelos.size)
		unJugador.iniciarDuelo(this.home.ahri,Ubicacion.TOP)
		assertEquals(1,unJugador.duelos.size)
		val resultadoJugador1 = unJugador.duelos.get(0).resultado
		assertTrue(resultadoJugador1 instanceof Empate)
	}
	
}