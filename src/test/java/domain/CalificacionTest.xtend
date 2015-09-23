package domain
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import java.util.ArrayList
import java.util.Arrays
import retador.Retador
import duelos.Duelo
import retador.NoIniciador
import retador.Iniciador
import veredicto.CalculadorDeCalificaciones
import java.util.List

class CalificacionTest {
	
	Jugador jugadorGanador
	Jugador jugadorPerdedor
	Jugador jugadorQueEmpata1
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
	EstadisticasPersonajes estadisticasDeUnRampage
	EstadisticasPersonajes estadisticasDeUnNoob	
	EstadisticasPersonajes estadisticaDeUnDominador
	EstadisticasPersonajes estadisticasDeUnKillingSpread
	Calificacion rampage
	Calificacion killing_spread 
	Calificacion noob 
	Calificacion dominador
	EstadisticasPersonajes estadisticasDeOtroRampage
	List<Ubicacion> ubicacionesNoRampage
	List<Ubicacion> ubicacionesNoDominador
		
	def agregandoDuelos(Jugador jug, int veces){
		(1..veces).forEach[
			jug.duelos.add(new Duelo(retadorQueGana,retadorQuePierde))
		]
	}
	
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
		
		val ubicacionesRampage = new ArrayList<Ubicacion>
		ubicacionesRampage.addAll(Arrays.asList(top,top,top,top,top,bottom))
		
		ubicacionesNoRampage = new ArrayList<Ubicacion>
		ubicacionesNoRampage.addAll(Arrays.asList(top,jungle,top,middle))
		
		ubicacionesNoDominador = new ArrayList<Ubicacion>
		ubicacionesNoDominador.addAll(Arrays.asList(top,jungle,bottom,middle))
		
		
		rampage = new Calificacion("RAMPAGE",100)
		killing_spread = new Calificacion("KILLING_SPREAD",60)
		noob = new Calificacion("NOOB",5)
		dominador = new Calificacion("DOMINADOR",80)
		
		
		estadisticasDeUnRampage = new EstadisticasPersonajes(wolverine,120,80, 30, 10, 50, ubicacionesRampage, top,rampage)
		estadisticasDeUnNoob = new EstadisticasPersonajes(gambito,4,1, 1, 1, 1, ubicacionesNoDominador, top,noob)		
		estadisticaDeUnDominador = new EstadisticasPersonajes(ciclope,12,8, 3, 1, 5, ubicacionesNoDominador, top,dominador)
		estadisticasDeUnKillingSpread = new EstadisticasPersonajes(bestia,4,1, 1, 1, 1, ubicacionesNoDominador, middle,killing_spread)
		estadisticasDeOtroRampage = new EstadisticasPersonajes(wolverine,30,18, 10, 6, 5, ubicacionesNoRampage, top,rampage)
				
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
		
		jugadorGanador.setSistema(sis)
		jugadorPerdedor.setSistema(sis)
		jugadorQueEmpata1.setSistema(sis)		
	}

	
	@Test 
	def testSetDeCalicacionRampage(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,top)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new Calificacion("RAMPAGE",100)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}

	@Test 
	def testEntraPorCalicacionPorDefecto(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,bottom)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,3)
		assertEquals("NOOB",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
		
	@Test 
	def testEntraPorCalicacionPorRampage(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,bottom)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,95)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorRampagePorNoTenerCantidadDeDuelosPrevios(){			
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,bottom)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).ubicacionesUsadas = ubicacionesNoRampage
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,95)
		assertNotEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
			
	@Test 
	def testEntraPorCalicacionPorDominador(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,bottom)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,85)
		assertEquals("DOMINADOR",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorDominadorPorPuntaje(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,middle)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,65)
		assertNotEquals("DOMINADOR",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorDominadorPorUbicacion(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,middle)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).ubicacionesUsadas = ubicacionesNoDominador
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,85)
		assertNotEquals("DOMINADOR",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorKillingSpread(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,middle)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,65)
		assertEquals("KILLING_SPREAD",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorManco(){	
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,top)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,35)
		assertEquals("MANCO",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testNoEntraPorCalicacionPorMancoDebidoAlaUbicacion(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,middle)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,35)
		assertNotEquals("MANCO",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		assertEquals("NOOB",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
	@Test 
	def testEntraPorCalicacionPorNoob(){		
		this.retadorQueGana = new Iniciador(jugadorGanador, wolverine,middle)
		assertEquals("RAMPAGE",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
		retadorQueGana.estadisticas(wolverine).calificacion = new CalculadorDeCalificaciones().calcular(retadorQueGana,5)
		assertEquals("NOOB",retadorQueGana.estadisticas(wolverine).calificacion.categoria)
	}
	
}