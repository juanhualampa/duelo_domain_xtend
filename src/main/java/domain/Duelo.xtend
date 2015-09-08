package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Duelo {
			
	Retador retador	
	Retador retado		
	Resultado resultado
	
	
	new(Sistema sistema, Retador ret1,  Retador ret2  )
	{
		this.retador = ret1
		this.retado = ret2
		this.realizarse(sistema)
	}
	
	def Integer poderDeAtaque(EstadisticasPersonajes est) 
	{
		(est.calificacion + (est.vecesKills + est.vecesAssist / 2 - est.vecesDeads) *
		est.vecesUsadoAntesDelDuelo) * new Random().nextInt(1)
	}	
	
	def Integer poder(Retador ret){
		poderDeAtaque(ret.personaje.estadistica)
	}
	
	def esMasPoderoso(Retador ret1, Retador ret2){
		poder(ret1) > poder(ret2)
	}
	
	def void realizarse(Sistema sistema){
					
		 if (esMasPoderoso(this.retador,this.retado)){
		 	/*
		 	 * la designacion de Victoria, Derrota y Empatados esta desde el punto de vista
		 	 * de quien propuso el duelo
		 	 */
			resultado = new Victoria (new Ganador(this.retador,this),new Perdedor(this.retado,this))
		 }
		 if (esMasPoderoso(this.retado,this.retador)){
		 	resultado = new Derrota (new Ganador(this.retado,this),new Perdedor(this.retador,this))	 	
		 }		 
		 else{
		 	resultado = new Empatados(new Empate(this))
		 }	
		 
		 /*
		  * armar el resultado
		  */
		  sistema.duelos.add(this)
	}
		
	
	
}