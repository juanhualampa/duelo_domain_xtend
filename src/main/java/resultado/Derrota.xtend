package resultado

import org.eclipse.xtend.lib.annotations.Accessors
import retador.Retador
import duelos.Duelo

@Accessors
class Derrota extends Resultado{
		
	override actualizarEstadisticas(Retador retador, Retador retado) {
		retado.aplicarActualizacionAlGanar
		retador.aplicarActualizacionAlPerder
	}
	
	override msj() {
		"Aceptar derrota con honor"
	}
	
	override saludo() {
		"Perdiste"
	}
	
}