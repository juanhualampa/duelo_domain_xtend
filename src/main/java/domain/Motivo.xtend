package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Motivo {
	
	String nombre;
	
	new(String nombre){
		this.nombre = nombre;
	}
    def Integer peso()
    def void evaluarse(Denuncia denuncia){
      	denuncia.aplicarPenalidad(denuncia.contexto.retado)
    }
		  
}



