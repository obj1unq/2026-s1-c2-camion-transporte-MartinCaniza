import cosas.*

object camion {
	const property cosas = #{}

	const pesoTara = 1000
		
	method cargar(cosa) {
		cosas.add(cosa)
	}

	method descargar(cosa){
		if (self.estaCargado(cosa)) {
			cosas.remove(cosa)
		}else{
			self.error("Lo requerido no se encuentra en el camion") // no se si tirar error o simplemente no hacer nada
		}
	}

	method cosas() { return cosas }

	method estaCargado(cosa){
		return cosas.contains(cosa)
	}
	
	method cantidadDeCosas() { return cosas.size()}

	method tieneCosasConPesoPar(){
		return  cosas.all({ cosa => cosa.peso() % 2 == 0 }) 
	}

	method algunoConPeso(peso){
		return cosas.any({ cosa => cosa.peso() == peso })
	}
	
	
	method pesoTotal(){
		return pesoTara + cosas.sum({ cosa => cosa.peso() })
	}

	method estaExcedido(){
		return self.pesoTotal() > 2500
	}

	method cosaConNivelDePeligrosidad(nivel){
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == nivel })
	}

	method cosasConMayorNivelDePeligrosidad(nivel){
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method cosasConNivelDePeligrosidadMayorA(cosa){
		return self.cosasConMayorNivelDePeligrosidad(  cosa.nivelPeligrosidad() )
	}
}
