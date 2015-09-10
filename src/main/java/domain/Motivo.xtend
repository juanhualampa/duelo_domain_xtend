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
      	duelo.retado.aplicarPenalidad(denuncia)
    }
	
	def void aplicarPenalidad(Retador contrincante, Denuncia denuncia){
		contrincante.jugador.recibioDenuncia(denuncia)
	}
	
	  
}



