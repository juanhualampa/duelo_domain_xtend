package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Duelo {
			
	Retador retador	
	Retador retado		
	Resultado resultado
	Sistema sistema;
	
	new(Retador ret1,  Retador ret2  )
	{
		this.retador = ret1
		this.retado = ret2
	}
	
	new(Sistema sis, Retador ret1,  Retador ret2)
	{
		this.retador = ret1
		this.retado = ret2
		this.sistema = sis;
	}
	
	def void realizarse(){
		this.retador.pelea(this.retado,this)
	}

	def sosGanador(Retador it) {
		println("Empiezo en duelo con " + jugador)
		setPostDuelo(new Ganador)
		it.actualizarEstadisticas
	}
		
	def sosPerdedor(Retador it) {
		println("Empiezo en duelo con " + jugador)
		setPostDuelo(new Perdedor)		
		it.actualizarEstadisticas
	}
		
	def void actualizarEstadisticas() {
		resultado.aplicarActualizacionesAEstadisticas(this)
	}
	
	def empataste(Retador it) {
		setPostDuelo(new Empate)
		it.actualizarEstadisticas
	}
	
	def boolean involucraA(Jugador it) {
		this.retador.jugador.equals || this.retado.jugador.equals
	}
	
	
}