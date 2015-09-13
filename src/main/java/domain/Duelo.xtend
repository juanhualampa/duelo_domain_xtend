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
		println("RET 1:" + it.poderDeAtaque)
		println("RET 1:" + ret.poderDeAtaque)
		if(esMasPoderosoQue(ret)){
			println("Entre por mas poderoso")			
			resultado = new Victoria
			this.actualizarEstadisticas(it,ret)
		}
		if(ret.esMasPoderosoQue(it)){
			println("Entre por menos poderoso")
			resultado = new Derrota
			this.actualizarEstadisticas(it,ret)			
		}
		else{
			println("Entre por empatados")			
			resultado = new Empatados
			this.actualizarEstadisticas(it,ret)		
		}
	}
	
	def sonIgualDePoderosos(Retador it, Retador ret){
		it.poderDeAtaque > ret.poderDeAtaque
	}

	def sosGanador(Retador it) {
		println("Empiezo en duelo con " + jugador)
		jugador.duelos.add(this)
		setPostDuelo(new Ganador)
		it.actualizarEstadisticasDelRetador
	}
		
	def sosPerdedor(Retador it) {
		println("Empiezo en duelo con " + jugador)
		jugador.duelos.add(this)
		setPostDuelo(new Perdedor)		
		it.actualizarEstadisticasDelRetador
	}
		
	def void actualizarEstadisticas(Retador it, Retador ret) {
		resultado.retador1 = it
		resultado.retador2 = ret
		resultado.aplicarActualizacionesAEstadisticas(this,it,ret)
	}
	
	def empataste(Retador it) {
		setPostDuelo(new Empate)
		it.actualizarEstadisticasDelRetador
	}
	
	def boolean involucraA(Jugador it) {
		this.retador.jugador.equals || this.retado.jugador.equals
	}
	
	
}