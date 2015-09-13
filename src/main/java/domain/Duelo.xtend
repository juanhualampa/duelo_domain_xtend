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
		if(esMasPoderosoQue(ret)){
			println("Entre por mas poderoso")			
			resultado = new Victoria(it,ret)	
			println(resultado)	
			println(resultado.retador1)
			println(resultado.retador2)
			actualizarEstadisticas()
		}
		if(ret.esMasPoderosoQue(it)){
			println("Entre por menos poderoso")
			resultado = new Derrota(it,ret)
			actualizarEstadisticas()			
		}
		else{
			println("Entre por empatados")			
			resultado = new Empatados(it,ret)
			actualizarEstadisticas()		
		}
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
		
	def void actualizarEstadisticas() {
		resultado.aplicarActualizacionesAEstadisticas(this)
	}
	
	def empataste(Retador it) {
		setPostDuelo(new Empate)
		it.actualizarEstadisticasDelRetador
	}
	
	def boolean involucraA(Jugador it) {
		this.retador.jugador.equals || this.retado.jugador.equals
	}
	
	
}