package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList
import java.util.Arrays

class CalificacionTest {
	
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
	Calificacion calGanadora	
	Calificacion calPerdedora
	
	def agregandoDuelos(Jugador jug, int veces){
		(1..veces).forEach[
			jug.duelos.add(new Duelo(ret1,ret2))
		]
	}
	
	@Before
	def void setUp() {
		this.sis = new Sistema()	
		this.ubi1 = Ubicacion.TOP;
		this.ubi2 = Ubicacion.BOTTOM;	
		this.per1 = new Personaje("Wolverine", Arrays.asList("Araniar", "Llorar!"),
			Arrays.asList("La ducha"),ubi1)
		this.per2 = new Personaje("Gambito", Arrays.asList("Tirarte cartitas","Tirar los perros"),Arrays.asList("Cualquier otra cosa"),Ubicacion.MIDDLE)
		
		
		calGanadora = new Calificacion("RAMPAGE",100)
		calPerdedora = new Calificacion("NOOB",5)
		
		val ubicacionesUsadas = new ArrayList<Ubicacion>
		ubicacionesUsadas.addAll(Arrays.asList(ubi1,ubi2,ubi1,ubi2,ubi1,ubi1,ubi1,ubi1))
		
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
		this.ret2 = new NoIniciador(jugador2, per2, ubi2)
	}

	
	@Test 
	def testSetDeCalicacionRampage(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new Calificacion("RAMPAGE",100)
		assertEquals("RAMPAGE",ret1.estadisticas(per2).calificacion.categoria)
	}

	@Test 
	def testEntraPorCalicacionPorDefecto(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,3)
		assertEquals("NOOB",ret1.estadisticas(per2).calificacion.categoria)
	}
	
		
	@Test 
	def testEntraPorCalicacionPorRampage(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calGanadora,ret1.estadisticas(per1).calificacion)
		ret1.estadisticas(per1).calificacion = new CalculadorDeCalificaciones().calcular(ret1,95)
		assertEquals("RAMPAGE",ret1.estadisticas(per1).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorRampagePorNoTenerCantidadDeDuelosPrevios(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,3)
		assertEquals(3,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,95)
		assertNotEquals("RAMPAGE",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorRampagePorNoTenerUbicacionIdeal(){	
		this.ret1 = new Iniciador(jugador1, per2,Ubicacion.JUNGLE)	
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,95)
		assertNotEquals("RAMPAGE",ret1.estadisticas(per2).calificacion.categoria)
	}
		
	@Test 
	def testEntraPorCalicacionPorDominador(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,2)
		assertEquals(2,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per1).calificacion = new CalculadorDeCalificaciones().calcular(ret1,85)
		assertEquals("DOMINADOR",ret1.estadisticas(per1).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorDominadorPorCantDuelosPrevios(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,1)
		assertEquals(1,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,85)
		assertNotEquals("DOMINADOR",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorDominadorPorUbicacion(){		
		this.ret1 = new Iniciador(jugador1, per2,Ubicacion.JUNGLE)
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,85)
		assertNotEquals("DOMINADOR",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorKillingSpread(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,65)
		assertEquals("KILLING_SPREAD",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorManco(){	
		this.ret1 = new Iniciador(jugador1, per2,Ubicacion.MIDDLE)
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,35)
		assertEquals("MANCO",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorMancoDebidoAlaUbicacion(){		
		this.ret1 = new Iniciador(jugador1, per2,Ubicacion.JUNGLE)
		agregandoDuelos(jugador1,5)
		assertEquals(5,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,35)
		assertNotEquals("MANCO",ret1.estadisticas(per2).calificacion.categoria)
		assertEquals("NOOB",ret1.estadisticas(per2).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorNoob(){		
		this.ret1 = new Iniciador(jugador1, per2,ubi1)
		agregandoDuelos(jugador1,1)
		assertEquals(1,jugador1.duelos.size)
		assertEquals(calPerdedora,ret1.estadisticas(per2).calificacion)
		ret1.estadisticas(per2).calificacion = new CalculadorDeCalificaciones().calcular(ret1,5)
		assertEquals("NOOB",ret1.estadisticas(per2).calificacion.categoria)
	}
	
}