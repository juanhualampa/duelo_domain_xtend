package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Motivo {
	
	String nombre;
	
	new(String nombre){
		this.nombre = nombre;
	}
    def Integer peso()
    def void evaluarse(Denuncia denuncia, Duelo duelo){
      	duelo.retador.aplicarPenalidad(denuncia)
    }
	
	def void aplicarPenalidad(Retador ret, Denuncia denuncia){
		ret.recibioDenuncia(denuncia)
	}
	
	def recibioDenuncia(Retador it, Denuncia den) {
		jugador.recibioDenuncia(den)
	}
	
	  
}



