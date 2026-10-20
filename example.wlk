class Hogar{
  var nivelDeMugre=0
  var comfort=0

  method esBueno(){
    return nivelDeMugre<= comfort/2 
  }
}

class Huerta{
  var capacidadDeProduccion=0
  var nivel=0

  method esBueno(){
    return capacidadDeProduccion>nivel
  }
}

class Mascota{
  var nivelDeSalud=0

  method esBueno(){
    return nivelDeSalud>250
  }
}

class Barrio{
  var elementos=[]
  method esCopado(){
   return self.cantidadDeElementosBuenos()>
    self.cantidadDeElementosNoBuenos()
    
  }

  method cantidadDeElementosBuenos(){
    return elementos.count({e=>e.esBueno()})
  }
  method cantidadDeElementosNoBuenos(){
    return elementos.count({e=>not e.esBueno()})
  }
}

class Plaga{
  var niveldeDaño=0
  var poblacion=0
  method transmiteEnfermedad(){

  }
}
