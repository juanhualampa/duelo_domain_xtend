package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*

class DenunciaTest {
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
	Motivo unMotivo
	Descripcion unaDescripcion
	Descripcion otraDescripcion
	Denuncia den
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
		this.ret1 = new Retador(jugador1, per1,ubi1,new Iniciador())
		this.ret2 = new Retador(jugador2, per2, ubi2,new NoIniciador())		
		this.duelo    = new Duelo( ret1, ret2)
		this.unMotivo = new AbusoDeHabilidad();	
		this.est1= new EstadisticasPersonajes(per1)
		this.est2= new EstadisticasPersonajes(per2)
		this.den = new Denuncia(duelo, unMotivo, unaDescripcion)
	}
		
	@Test
	def testJugadoresTienenPersonajesYSistemaTieneJugadores() {
		jugador1.getEstadisticasPersonajes.add(est1)
		jugador2.getEstadisticasPersonajes.add(est2)
		assertEquals(2,sis.jugadores.size)
		assertEquals(per1.nombre,jugador1.estadisticasPersonajes.get(0).personaje.nombre)
		assertEquals(per2.nombre,jugador2.getEstadisticasPersonajes.get(0).personaje.nombre)
	}
	
//	@Test
//	def testFuncionaObtenerUltimoDueloContra() {
//		assertEquals(0,jugador1.duelos.size)
//		jugador1.duelos.add(duelo)
//		assertEquals(1,jugador1.duelos.size)
//		assertEquals(duelo,jugador1.obtenerUltimoDueloContra(jugador2))
//	}
	
	@Test
	def testHagoUnaDenunciaValida() {
		jugador1.duelos.add(duelo)
		jugador2.duelos.add(duelo)
		unaDescripcion= new Descripcion("denuncio abuso de habilidad")
		jugador1.denunciarAJugador(jugador2,unMotivo,unaDescripcion)
		assertEquals(0,jugador1.denuncias.size)	
		assertEquals(5,jugador1.denuncias.get(0).unMotivo.peso)			
	}
	
	@Test
	def testHagoUnaDenunciaInValida() {
		jugador1.duelos.add(duelo)
		jugador2.duelos.add(duelo)
		otraDescripcion= new Descripcion("denuncio")
		jugador2.denunciarAJugador(jugador1,unMotivo,otraDescripcion)
		assertEquals(1,jugador1.denuncias.size)	
	}
	
	
	
}