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
		this.actualiza(new Ganador(ret,this))
	}
	
	def sosPerdedor(Retador ret) {
		this.actualiza(new Perdedor(ret,this))
	}
	
	def dispatch actualiza(Ganador ganador){
		ganador.actualizarEstadisticas
	}
	
	def dispatch actualiza(Perdedor perdedor){
		perdedor.actualizarEstadisticas
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