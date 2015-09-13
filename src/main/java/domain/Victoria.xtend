package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Victoria extends Resultado{
	
	Retador retador1
	Retador retador2
	
	new(Retador ganador, Retador perdedor) {
		super(ganador,perdedor)
	}
	
	def nombreGanador(){
		retador1.jugador.nombre
	}
	
	def nombrePerdedor(){
		retador2.jugador.nombre
	}
	
	override aplicarActualizacionesAEstadisticas(Duelo it) {
		println("Estoy en victoria")
		sosGanador(retador1)
		sosPerdedor(retador2)
	}
	
	override visualizacion() {
		"Ganaste contra «nombrePerdedor», " //falta el tema de los puntos
	}
	
}