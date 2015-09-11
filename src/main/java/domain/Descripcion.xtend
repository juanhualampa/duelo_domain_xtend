package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.Arrays
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Descripcion {
	
	String palabras
	
	new (String palabras){
		this.palabras = palabras;
	}
		
	def poseeAlMenos20Caracteres(){
		palabras.length > 20
	}
	
	def sonAlMenos3Palabras(){
		val myList = new ArrayList<String>(Arrays.asList(palabras.split(" ")));
		myList.size > 2
	}
	
	def static void main(String [] args){
		val desc = new Descripcion("denuncio abuso de habilidad")
		println(desc.poseeAlMenos20Caracteres)
		val myList = //new ArrayList<String>(Arrays.asList(desc.palabras.split("\\s*,\\s*")))
		new ArrayList<String>(Arrays.asList(desc.palabras.split(" ")));
		println(myList);  
		println(myList.size);
		// e imprime [Java, es, malo, ,, Xtend, es, bueno] lo cual es feo 
		// con lo cual habria que googlear otro regex.
	}
	
	
}