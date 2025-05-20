// NUEVO TEMA: CLASES
//  YA NO DEBO VENIR A TOCAR EL CÓDIGO PARA AJUSTARLO A LO QUE NECESITE HACER.
//  ^ PARA ESO ESTÁN LAS CLASES
//
//
import wollok.game.*
object corsa1 {
  var property color = "rojo" 
  method capacidad() = 4 // No hay forma de que esto cambie.
  method velocidadMaxima() = 150
  method peso() = 1300
}

object corsa2 {
  var property color = "verde" 
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 1300
}

object corsa3 {
  var property color = "verde" 
  method capacidad() = 4
  method velocidadMaxima() = 150
  method peso() = 1300
}

// Para no hacer eso ^, puedo utilizar CLASES: me sirven para crear muchos objetos con la misma definición. Como un "molde". Permite generar muchos objetos del mismo tipo.
// EL OBJETO YA EXISTE. LA CLASE NO ES UN OBJETO! ES EL MOLDE!! PARA PODER CREAR OBJETOS!!! Vamos a tener que crear objetos a partir de esa clase, x eso no hay nada en el diagrama dinámico. "Instanciar: crear un objeto a partir de un molde. Instaciar un objeto a partir de una clase"
// SE DEFINEN ASÍ, con mayúscula el nombre !! Las clases permiten definir atributos sin inicializar a diferencia de cuando defino objetos directamente.
class Corsa {
  //var property color = "rojo"
  var property color //Esto lo INFORMO en el constructor del objeto, porque no está inicializado.
  var position = new Position(x=4, y=7) // PARTE 4. POSITION ES UNA REPRESENTACIÓN DE UNA INSTANCIA DE UNA CLASE. POSITION ES UNA CLASE QUE TIENE 2 ATRIBUTOS (x;y)
  // ^ es lo mismo que hacer: game.at(0,0)    POSITION CREA UNA NUEVA INSTANCIA EN OTRA UBICACIÓN. i.e x=1 y=0. Si vuelvo para atrás debo crear una nueva instancia de la clase Position.
  // ^ igual que: var lista = [] == new List()
  // REVISAR WOLLOK DOCS => WOLLOK GAME !!!!!!

  const pasoPor = [] // Tarea para casa (?)


  method capacidad() = 4 // No hay forma de que esto cambie.
  method velocidadMaxima() = 150
  method peso() = 1300
}

// CONSTRUCTOR. CREAR OBJETOS A PARTIR DE X CLASE (EN CONSOLA)
// new Corsa(color="rojo") <- entre paréntesis le paso el atributo que falta inicializar. O sea, el "a informar" de la consigna ...

// Cuando creo listas en consola no aparecen en diagrama dinámico xq nadie la conoce, no hay nadie que la referencie. Entonces hago que una constante la apunte.
//cuando creo un nuevo corsa, lo crea pero no puedo usarlo si no le doy una referencia. Puedo referenciarlo a través de constantes/variables o a través de LISTAS, porque las listas tienen ÍNDICES (que también son flechas/referencias)
//const listaDeAutos = [new Corsa(color="rojo")] -acá la lista conoce a un objeto de la clase Corsa.-
//listaDeAutos.add(new Corsa(color="rojo")) -esto va a agregar un índice 1 que va a crear otro objeto de la instancia Corsa.-
//el objeto es Corsa, pero ya no son objets con nombre y apellido como veníamos haciendo. Ahora son objetos DE CLASE Corsa.
// self va a ser la instancia de la clase del objeto. (?)


//En las clases puedo usar el mensaje initialize para realizar validaciones.
class Kwid {
  var property tieneTanqueAdicional // Este mensaje no lo pongo en el Corsa y no rompe polimorfismo xq al Corsa no le interesa.
                          // Si hago variable, debo tener un método que me permita cambiarla.
  // ESTO ESTÁ MAL: var capacidad = 0
  //                method calcularCapacidad() {}       PARA QUÉ ????

  method capacidad() = if(tieneTanqueAdicional) 3 else 4 // Expresión ternaria DE ACÁ A LA CHINA !!!!!!!! No es una condicional compleja ! ! ! Ternaria y simple.
  method velocidadMaxima() = if(tieneTanqueAdicional) 110 else 120
  method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
  method color() = "azul" //Son strings xq no tienen comportamiento especial. Debe llamarse exactamente color() x polimorfismo y aparte es method xq no cambia nunca.
}

// Guarda con definir una clase de un objeto que es ÚNICO .
object trafic {

  var interiorMAL = "comodo" // le delego la responsabilidad a un objeto !!!
  method capacidadMAL() = if(interior=="comodo") 5 else 12 // Esto esta HORRIBLE !!
  

  var property interior = comodo // objeto !! Delego responsabilidades.
  var property motor = pulenta
  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidad()
  method peso() = 4000 + interior.peso() + motor.peso()
  method color() = "blanco"
}

object pulenta {
  method peso() = 800
  method velocidad() = 130 // method porque nunca cambia. No tiene por qué llamarse igual que el método polimórfico de los rodados.
}

object bataton {
  method peso() = 500
  method velocidad() = 80
}

object comodo {
  method capacidad() = 5
  method peso() = 700
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}

// Clases: una vez que el código está en ejecución, yo puedo ir creando todos los objetos que quiera a partir de ese molde. Sin las clases, tenía que volver a tocar el código todo de vuelta etc, un lío.
class Especial {

  var property capacidad
  var property peso
  var property color
    // Cuando una clase maneja un valor común para todas sus instancias, uso un objeto externo. MUY PRESENTE EN EL PARCIAL 2 !!!!
    // Si tiene que ser un valor para todas las instancias de esa clase, es un método. Pero si ese valor puede cambiar, es un objeto aparte.
  const velocidadMaxima
  method velocidadMaxima() = // para buscar un máximo usamos un min
    velocidadMaxima.min(topeVelocidadMaxima.tope())
  // const property velocidadMaxima -> Por más que ponga un const property, al ser CONST no me permite cambiarle el valor ! ! ! 
}
// instancia de la clase Especial = un objeto de la clase Especial.

object topeVelocidadMaxima {
  var property tope = 200
}

// Puedo hacerlo en un archivo aparte si quiero (el profe no lo hizo; lo hizo acá nomás)
class Dependencia {
  const flota = []
  var property empleados = 0 // Puedo no inicializarlo pero el profe lo inicializó xq sí
  method agregarAFlota(rodado) {flota.add(rodado)}
  method quitarDeFlota(rodado) {flota.remove(rodado)}
  method pesoTotalFlota() = flota.sum({r=>r.peso()})

  method estaBienEquipada() = 
    self.tieneAlMenosRodados(3) && self.todosVanAlMenosA100() // DELEGO !! No voy a hacer todo en una misma expresión porque es complicarse la vida.
  // es muy importante delegar!!!! delegar > resolver directamente ahí en el mismo método que busca otra cosa o algo así ...
  // Queda más lindo "lo pienso después". No está bueno una expresión matemática ahí en estaBienEquipada() directamnete para resolver lo de los 3 rodados ..
  // DELEGAR ES NO ENROSCARSE EN EL MOMENTO A RESOLVER TODO AL MISMO TIEMPO !! AYUDA A PROGRAMAR MÁS RÁPIDO!!
  
  //métodos auxiliares del método estaBienEquipada()
  method tieneAlMenosRodados(cantidad) = flota.size() >= cantidad // Antes: tieneAlMenos3Rodados() = flota.size() > 2, lo modifico (lo parametrizo) para poder reutilizar el método.
  method todosVanAlMenosA100() = flota.all({r=>r.velocidadMaxima() >= 100})
  
  method capacidadTotalEnColor(color) =
    self.rodadosDeColor(color).sum({r=>r.capacidad()})
  method rodadosDeColor(color) = flota.filter({r=>r.color() == color})
  method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
  method rodadoMasRapido() = flota.max({r=>r.velocidadMaxima()}) // el mensaje list.max(Transf) me devuelve el OBJETO que cumple con la condición del Transformer .!
  method capacidadFaltante() = (empleados - self.capacidadDeLaFlota()).max(0) // Controlo que no me de resultado negativo.
  method capacidadDeLaFlota() = flota.sum({r=>r.capacidad()})
  method esGrande() = empleados >= 40 && self.tieneAlMenosRodados(5)
}
// LOS OBJETOS QUE SE VAYAN A CREAR DE UNA MISMA CLASE, POR DEFINICIÓN, YA SON POLIMÓRFICOS.

