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
		this.pelea(this.retador,this.retado)
	}
	
	def void pelea(Retador it,Retador ret) {
		switch it {
		  case esMasPoderosoQue(ret)   : aplicar(new Victoria(it,ret))
		  case ret.esMasPoderosoQue(it): aplicar(new Derrota(it,ret))
		  default                  : aplicar(new Empatados(it,ret))
		} 
	}
	
	def aplicar(Resultado r){
		println("Entre por " + r.toString)			
		resultado = r
		this.actualizarEstadisticas
		r.retador1.jugador.duelos.add(this)
		r.retador2.jugador.duelos.add(this)
	}
	
	def sonIgualDePoderosos(Retador it, Retador ret){
		it.poderDeAtaque > ret.poderDeAtaque
	}

	def sosGanador(Retador it) {
		println("Empiezo en duelo siendo Ganador con " + jugador)
		setPostDuelo(new Ganador)
		it.actualizarEstadisticasDelRetador
	}
		
	def sosPerdedor(Retador it) {
		println("Empiezo en duelo siendo Perdedor con " + jugador)
		jugador.duelos.add(this)
		setPostDuelo(new Perdedor)		
		it.actualizarEstadisticasDelRetador
	}
		
	def void actualizarEstadisticas() {
		resultado.aplicarActualizacionesAEstadisticas(this)
	}
	
	def empataste(Retador it) {
		println("Empiezo en duelo Empatando con " + jugador)
		setPostDuelo(new Empate)
		it.actualizarEstadisticasDelRetador
	}
	
	def boolean involucraA(Jugador it) {
		this.retador.jugador.equals || this.retado.jugador.equals
	}
	
	
}