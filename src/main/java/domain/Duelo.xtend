package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Duelo {
			
	Retador retador	
	Retador retado		
	Resultado resultado
	
	new(Retador ret1,  Retador ret2  )
	{
		this.retador = ret1
		this.retado = ret2
	}
		
	def void realizarse(){
		this.pelea(retador,retado)
	}
		
	/**
	 * ejecuta la pelea entre retadores, aplicando las actualizaciones de estadisticas necesarias segun el caso
	 */
	def void pelea(Retador it,Retador ret) {
		switch it {
		  case esMasPoderosoQue(ret)   : aplicar(new Victoria(it,ret))
		  case ret.esMasPoderosoQue(it): aplicar(new Derrota(it,ret))
		  default                  : aplicar(new Empatados(it,ret))
		} 
	}
	
	def aplicar(Resultado r){			
		resultado = r
		r.actualizarEstadisticas
		r.v1.retador.agregarDuelos(this) 
		r.v1.retador.agregarDuelos(this)
	}
	
	def agregarDuelos(Retador it,Duelo duelo) {
		jugador.duelos.add(duelo)
	}
	
	def sonIgualDePoderosos(Retador it, Retador ret){
		it.poderDeAtaque == ret.poderDeAtaque
	}
	
	def boolean involucraA(Jugador jug) {
		this.retador.jugador.equals(jug) || this.retado.jugador.equals(jug)
	}
	
	
	
}