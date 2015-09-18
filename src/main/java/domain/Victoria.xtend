package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Victoria extends Resultado{
	
	new(Retador r1, Retador r2){
		this.retador1 = r1
		this.retador2 = r2
	}
	
	def nombreGanador(){
		retador1.jugador.nombre
	}
	
	def nombrePerdedor(){
		retador2.jugador.nombre
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		retador.aplicarVeredicto(new Ganador)
		retado.aplicarVeredicto(new Perdedor)
	}
	
	override visualizacionParteSuperior() {
		"Ganaste contra "+ nombrePerdedor//falta el tema de los puntos
	}
	
	override String visualizacionInferior() {
		"Ganador:" + this.retador1.jugador.nombre + "!!! - " + 
		this.retador1.estadisticas(this.retador1.personaje).calificacion.nro + " puntos contra " +
		this.retador2.estadisticas(this.retador2.personaje).calificacion.nro
	}
	
	
	
}