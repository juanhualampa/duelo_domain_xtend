package veredicto

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador

@Accessors
abstract class ActualizadorDeStats {
	
	
	
	new(){
		
	}
	
	def void aplicarActualizacion(Retador it){
		this.actualizarse(it)
	}
	
	def paraInicializadores(Retador it){		
		estadisticas(personaje).agregarUnaParticipacion
		estadisticas(personaje).ubicacionesUsadas.add(ubicacion)
	}
	
	def void actualizarse(Retador retador)
	
	
}