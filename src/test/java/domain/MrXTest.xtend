package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.Arrays
import retador.Retador
import retador.Iniciador

class MrXTest {
	Jugador jugador1
	Juego juego 
	Ubicacion ubi1
	Ubicacion ubi2		
	Personaje per1 
	Personaje per2
	Retador ret1 	
	EstadisticasPersonajes est1
	EstadisticasPersonajes est2
	
	
	@Before
	def void setUp() {
		this.juego = new Juego()		
		
		this.ubi1 = Ubicacion.TOP;
		this.ubi2 = Ubicacion.BOTTOM;
		this.per1 = new Personaje("Wolverine", Arrays.asList("Araniar", "Llorar!"),
			Arrays.asList("La ducha"),ubi1)
		this.per2 = new Personaje("Gambito", Arrays.asList("Tirarte cartitas","Tirar los perros"),Arrays.asList("Cualquier otra cosa"),Ubicacion.MIDDLE)
		this.est1= new EstadisticasPersonajes(per1)
		this.est2= new EstadisticasPersonajes(per2)
		
		this.jugador1 = new Jugador("Luciano",Arrays.asList(est1, est2))
		jugador1.registrarEn(juego)
		this.ret1 = new Iniciador(jugador1, per1,ubi1)
	}
	
	@Test 
	def testsNoHayOponenteParaEsteJugador(){	
		assertTrue(juego.noHayOponente(ret1))
	}
	
	@Test 
	def testsComoNoHayOponenteParaEsteJugadorPeleaConMrX(){	
		assertEquals(0,jugador1.duelos.size)
		assertTrue(juego.noHayOponente(ret1))
		val duelo = juego.realizarDuelo(ret1,juego.dameAMRX(ret1))
		assertEquals(1,jugador1.duelos.size)
		assertEquals("MR.X",duelo.retado.jugador.nombre)
		assertEquals(Ubicacion.BOTTOM,duelo.retado.ubicacion)
	}
	
}