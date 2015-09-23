package veredicto

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador

@Accessors
abstract class Veredicto {
	
	Retador retador	
	
	new(Retador r1){
		this.retador = r1
	}
	
	def void aplicarActualizacion(){
		this.actualizarse(retador)
	}
	
	def paraInicializadores(Retador it){		
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).ubicacionesUsadas.add(ubicacion)
	}
	
	def void actualizarse(Retador retador)
	
	
}