package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Victoria extends Resultado{	
	
	new(Retador r1, Retador r2){
		super(r1,r2)
	}
			
	override actualizarEstadisticas() {
		v1.aplicarActualizacion
		v2.aplicarActualizacion
	}
	
	
	
	
}