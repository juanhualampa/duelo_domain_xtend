package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Derrota extends Resultado{
		
	new(Retador r1, Retador r2){
		super(r1,r2)
	}	
	
}