package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Perdedor extends Veredicto{
	
	Retador participante
	Duelo duelo
	
	new(Retador participante, Duelo duelo) {
		super(participante,duelo)
	}
		
	override actualizar(EstadisticasPersonajes estadistica) {
		estadistica.agregarUnaParticipacion
		this.participante.actualizacionesDependientesDeLaPosicion()		
	}	
}