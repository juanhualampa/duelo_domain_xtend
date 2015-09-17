package domain

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class NoHayOponenteException extends Exception{
	String titulo = "No tienes rival!!!"
	String mensaje = "NO HAY QUIEN SE TE ANIME EN TU RANKING ACTUAL."
}