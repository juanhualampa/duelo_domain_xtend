package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Duelo {
	
	Sistema sistema			
	Retador retador	
	Retador retado	
	Ubicacion ubicacionRetador	
	Ubicacion ubicacionRetado	
	Resultado resultado
	
	
	new(Sistema sistema, Retador ret1 , Ubicacion u1, Retador ret2 ,  Ubicacion u2 )
	{
		this.sistema = sistema
		this.retador = ret1
		this.retado = ret2
		this.ubicacionRetador = u1
		this.ubicacionRetado = u2
	}
	
	def Integer poderDeAtaque(EstadisticaJugadorPersonaje est) 
	{
		(est.calificacion + (est.vecesKills + est.vecesAssist / 2 - est.vecesDeads) *
		est.vecesUsadoAntesDelDuelo) * new Random().nextInt(1)
	}	
	
	def Integer poder(Retador ret){
		poderDeAtaque(sistema.obtenerEstadistica(ret))
	}
	
	def esMasPoderoso(Retador ret1, Retador ret2){
		poder(ret1) > poder(ret2)
	}
	
	def void realizarse(){
					
		 if (esMasPoderoso(this.retador,this.retado)){
			resultado = new Victoria (new Ganador(this.retador,ubicacionRetador,this),new Perdedor(this.retado,ubicacionRetador,this))
		 }
		 if (esMasPoderoso(this.retado,this.retador)){
		 	resultado = new Derrota (new Ganador(this.retado,ubicacionRetado,this),new Perdedor(this.retador,ubicacionRetador,this))	 	
		 }		 
		 else{
		 	resultado = new Empatados(new Empate(this))
		 }	
		 
		 /*
		  * armar el resultado
		  */
	}
		
	
	
}