package domain

abstract class Motivo {
	
      def Integer peso()
      def void evaluarse(Duelo duelo){
      	duelo.retador.aplicarPenalidadContraSiCorresponde(duelo.retado)
      }
	
	def void aplicarPenalidadContraSiCorresponde(Retador retador, Retador retado) 
	
	  
}



