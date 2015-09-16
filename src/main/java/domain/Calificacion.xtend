package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Calificacion{
	
	String categoria	
	int nro
	
	new(String categoria, int nro){
		this.categoria = categoria
		this.nro = nro
	}
	
}