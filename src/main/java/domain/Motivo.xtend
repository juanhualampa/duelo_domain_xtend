package domain

abstract class Motivo {
	
      def Integer peso()
      def void evaluarse(Denuncia denuncia, Duelo duelo){
      	duelo.retado.aplicarPenalidad(denuncia)
      }
	
	def void aplicarPenalidad(Retador contrincante, Denuncia denuncia){
		contrincante.jugador.recibioDenuncia(denuncia)
	}
	
	  
}



