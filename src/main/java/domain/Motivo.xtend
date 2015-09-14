package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Motivo {
	
	String nombre;
	
	new(String nombre){
		this.nombre = nombre;
	}
    def Integer peso()
    def void evaluarse(Denuncia denuncia, Duelo it){
    	println(it)
    	println(retador)
    	println(retado)
      	retado.aplicarPenalidad(denuncia)
    }
	
	def void aplicarPenalidad(Retador it, Denuncia denuncia){
		jugador.recibioDenuncia(denuncia)
	}
	
	  
}



