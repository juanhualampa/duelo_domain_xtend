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
		//this.realizarse()
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

	def sosGanador(Retador ret) {
		new Ganador(ret,this).actualizarEstadisticas
	}
	
	def sosPerdedor(Retador ret) {
		new Perdedor(ret,this).actualizarEstadisticas
	}
	
	def void actualizarEstadisticas() {
		resultado.aplicarActualizacionesAEstadisticas(this)
	}
	
	def empataste(Retador ret) {
		new Empate(ret,this).actualizarEstadisticas
	}
	
	def boolean involucraA(Jugador jugador) {
		this.retador.jugador.equals(jugador) || this.retado.jugador.equals(jugador)
	}
	
	
}