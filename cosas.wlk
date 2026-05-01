object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
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
}

object bumblebee{

	var modoActual = auto
	
	method transformar(_modoActual){
		modoActual = _modoActual
	}

	method peso() { return 800 }

	method nivelPeligrosidad() {
		if ( self.estaTransformado())  {
			return modoActual.nivelDePeligrosidad()
		} else {
			return modoActual.nivelDePeligrosidad()
		}
	 }

	method estaTransformado() { return modoActual.estaTransformado() }
}


object auto{ //el nombre debería ser mas especifico? como: autoDeBumblebee?. O lo esperado es que se modele de otra forma? 

	method estaTransformado(){ return true }
	method nivelDePeligrosidad() { return 15 }
}

object robot{ //misma duda que con auto
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
}


object residuosRadioactivos{
	var peso = 0

	method peso() { return peso }

	method peso(_peso){
		peso = _peso
	}

	method nivelPeligrosidad() { return 200 }
}


