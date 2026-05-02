import cosas.*
import camion.*


//esto CREO que trae un problema (es mi duda también). Si bien hemos visto que los objetos son únicos,
// al tratar esto como un almacen, puede pasar que el camion descargue algo ya existente en el mismo, por ejemplo:
// si el camion descarga 50 ladrillos y luego otros 50, al tratar el almacen como un set, el segundo paquete de ladrillos no se almacenaría.
// honestamente indagué en la documentación de wollok pero no ví mucho al respecto (de cómo podría interactuar para tal escenario). 
// Indagué con la IA y me dijo que se podría solucionar si el objeto es creado a partir de una clase, de esta forma cada paquete de ladrillos 
//sería un objeto distinto, aunque tengan la misma cantidad de ladrillos (de todas formas esto no lo vimos aún en la materia).
// La otra forma seria tratar al almacen como una lista, pero al ser el camion un set, no sabría a la hora de hacer los test en qué orden me dejaría--
//las cosas cuando se hace un set2list, lo que me complicaría a la hora de hacer los asserts (creo que es posible de todas formas pero los test quedarían muy 'engorrosos').

// Luego de pensar, en sí tales objetos solo existirá 1 (creería). 
// Por ejemplo, el paquete de ladrillos es un objeto único, no hay 2 paquetes de ladrillos iguales, sino que el mismo paquete de ladrillos es el que se va a cargar y descargar.
// El mismo caso para todas las cosas. Bajo esta definición, no existe el problema anterior.
// Por esto es que mi decisión fue usar un SET
object almacen {

    const almacen = #{}

    method almacen() { return almacen }

    method almacenar(cosa) {

        almacen.add(cosa)
    }

}

object ruta9{

    method puedeCircular(camion){
        return camion.puedeCircular(20)
    }
}

object caminosVecinales{
    var pesoPermitido = 10

    method pesoPermitido(){ return pesoPermitido}

    method pesoPermitido(_pesoPermitido){
        pesoPermitido = _pesoPermitido
    }

    method puedeCircular(camion){
        return camion.pesoTotal() <= pesoPermitido
    }
}