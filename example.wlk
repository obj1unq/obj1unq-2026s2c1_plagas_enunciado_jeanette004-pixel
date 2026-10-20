class Hogar{
  var nivelDeMugre=0
  var comfort=0

  method esBueno(){
    return nivelDeMugre<= comfort/2 
  }
}

class Huerta{
  var property capacidadDeProduccion=0
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
  var poblacion=0

  method poblacion(){
    return poblacion
  }
  method transmiteEnfermedad(){
    return poblacion>10
  }

  method niveldeDaño(){
    return 0
  }
}

class Cucarachas inherits Plaga{
  var property peso=0

  override method nivelDeDaño(){
    return poblacion/2
  }
  override method transmiteEnfermedad(){
    return super() && peso>=10
  }
}


class Mosquitos inherits Plaga{
  method nivelDeDaño(){
      return poblacion
  }

  override method transmiteEnfermedad(){
    return super()&& poblacion % 3 ==0
  }

}
class Pulgas inherits Plaga{
  override method niveldeDaño(){
    return poblacion*2
  }

}

class Garrapatas inherits Pulgas{
}