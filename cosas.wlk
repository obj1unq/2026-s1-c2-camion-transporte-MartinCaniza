object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method totalBultos() { return 1 }
}


object arenaAGranel {
	var peso = 0

	method peso(_peso){
		peso = _peso
	}

	method peso(){

		 return peso 
	}

	method nivelPeligrosidad() { return 1 }
	method totalBultos() { return 1 }
}

object bumblebee{

	var modoActual = auto
	
	method modoActual(_modoActual){
		modoActual = _modoActual
	}

	method cambiarTransformacion(){
		modoActual = modoActual.transformacionOpuesta()
	}

	method peso() { return 800 }

	method nivelPeligrosidad() {
			return modoActual.nivelDePeligrosidad()
	 }

	method estaTransformado() { return modoActual.estaTransformado() }

	method totalBultos() { return 2 }
}


object auto{ //el nombre debería ser mas especifico? como: autoDeBumblebee?. O lo esperado es que se modele de otra forma? 
	method transormacionOpuesta(){ return robot }
	method estaTransformado(){ return true }
	method nivelDePeligrosidad() { return 15 }
}

object robot{ //misma duda que con auto
	method transormacionOpuesta(){ return auto }
	method estaTransformado(){ return false }
	method nivelDePeligrosidad() { return 30 }
}


object paqueteDeLadrillos{
	const pesoLadrillo = 2
	var cantidadLadrillos = 0

	method cantidadLadrillos() { return cantidadLadrillos }

	method cantidadLadrillos(_cantidadLadrillos){
		cantidadLadrillos = _cantidadLadrillos
	}

	method nivelPeligrosidad() { return 2 }

	method peso() { return cantidadLadrillos * pesoLadrillo }

	method totalBultos(){
		 return if ( cantidadLadrillos <= 100){
		 			1
		 		}  
				else if(cantidadLadrillos >= 101 && cantidadLadrillos <= 300){
		 			2
		 		}
				else{3}
	}

}


object bateriaAntiaerea{

	var tieneMisiles = false

	method tieneMisiles(_tieneMisiles){
		tieneMisiles = _tieneMisiles
	}

	method tieneMisiles() { return tieneMisiles }

	method peso(){
		if (tieneMisiles) {
			return 300
		} else {
			return 200
		}
	}

	method nivelPeligrosidad() {
		if (tieneMisiles) {
			return 100
		} else {
			return 0
		}
	 }

	method totalBultos() {

		return if (tieneMisiles) {
			2
		} else {
			1
		}

	}
}


object residuosRadioactivos{
	var peso = 0

	method peso() { return peso }

	method peso(_peso){
		peso = _peso
	}

	method nivelPeligrosidad() { return 200 }
	method totalBultos() { return 1 }
}
	
object contenedorPortuario{
	const peso = 100

	const property cosas = #{}

	method cosas() { return cosas }

	method peso() { return peso + cosas.sum({ cosa => cosa.peso() }) }

	method nivelPeligrosidad(){
		return if ( cosas.isEmpty() ){
				 			0
				} 
				else{  
					cosas.max({ cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() 
				}
	}

	// deberia hacer un metodo de descarga? el enunciado no lo pide, pero quizas es necesario.
	method cargar(cosa) {
		cosas.add(cosa)
	}

	method totalBultos(){
		return 1 + cosas.sum({ cosa => cosa.totalBultos() })
	}
}

object embalajeDeSeguridad{
	var cosa = arenaAGranel

	method cosa() { return cosa }

	method peso() { return cosa.peso() }
	
	method nivelPeligrosidad() { return cosa.nivelPeligrosidad() / 2 }

	method embalar(_cosa) {
		cosa = _cosa
	}

	method totalBultos() { return 2 + cosa.totalBultos() }
}