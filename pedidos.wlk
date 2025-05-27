import rodados.*

class Pedido {
    var property distancia // Podría ser constante
    var tiempoMaximo // No es property porque no lo vamos a poder setear con un valor nuevo. Para eso están los métodos "acelerar" y "relajar"
    var property pasajeros // var property setter y getter
    const property coloresIncompatibles = #{} // const property getter. Lo inicializo para no tener que validarlo

    method acelerar() {tiempoMaximo = 1.max(tiempoMaximo - 1)}
    method relajar() {tiempoMaximo = tiempoMaximo + 1}
    method initialize() {
        if(!distancia.between(1,1000)) {
            self.error(distancia.toString() + " no es válida")
        }
        if(!tiempoMaximo.between(1,100)) {
            self.error(tiempoMaximo.toString() + " no es válida")
        }
        if(!pasajeros.between(1,100)) {
            self.error(pasajeros.toString() + " no es válida")
        }
    }
    
    method agregarColorIncompatible(unColor) {
        if(!coloresValidos.listaColores().contains(unColor)) {
            self.error(unColor.toString() + " no es un color válido")
        }
        coloresIncompatibles.add(unColor)
    }

    method velocidadRequerida() = distancia / tiempoMaximo // si no quiero decimales: distancia.div(tiempoMaximo)

    method puedeSatisfacer(unAuto) =
        //todo va a ser una sola expresión anidada por distintos conectores. Por eso puedo usar el = y no el return.
        unAuto.velocidadMaxima() >= self.velocidadRequerida() + 10
        && unAuto.capacidad() >= pasajeros
        && not self.colorIncompatible(unAuto.color())
    method colorIncompatible(unColor) = coloresIncompatibles.contains(unColor)
}