class Hogar{
  var nivelDeMugre=0
  var comfort=0

  method nivelDeMugre(){
    return nivelDeMugre
  }
   method esBueno(){
    return nivelDeMugre<= comfort/2 
  }

  method teAtacaron(plaga_){
    nivelDeMugre=nivelDeMugre+plaga_.nivelDeDaño()
  }
}

class Huerta{
  var property capacidadDeProduccion=0
  var nivel=0

  method esBueno(){
    return capacidadDeProduccion>nivel
  }

  method teAtacaron(plaga_){
    if(plaga_.transmiteEnfermedad()){
      capacidadDeProduccion=capacidadDeProduccion-10-plaga_.nivelDeDaño()%3
    }else{
      capacidadDeProduccion=capacidadDeProduccion-plaga_.nivelDeDaño()%3
    }
  }
}

class Mascota{
  var nivelDeSalud=0

  method esBueno(){
    return nivelDeSalud>250
  }
  method teAtacaron(plaga_){
    if(plaga_.transmiteEnfermedad()){
      nivelDeSalud=nivelDeSalud-plaga_.nivelDeDaño()
    }  
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
  var property poblacion=0

  method poblacion(){
    return poblacion
  }
  method transmiteEnfermedad(){
    return poblacion>10
  }

  method niveldeDaño(){
    return 0
  }

  method atacar(elemento_){
    elemento_.teAtacaron(self)
    poblacion=poblacion+poblacion%10
  }
}

class Cucaracha inherits Plaga{
  var property peso=0

  override method poblacion(poblacion_){
    poblacion=poblacion_
  } 

  override method nivelDeDaño(){
    return poblacion/2
  }
  override method transmiteEnfermedad(){
    return super() && peso>=10
  }
  override method atacar(elemento_){
    super(elemento_) 
    peso=peso+2
  }
}


class Mosquito inherits Plaga{
  override method poblacion(poblacion_){
    poblacion=poblacion_
  } 
  method nivelDeDaño(){
      return poblacion
  }

  override method transmiteEnfermedad(){
    return super()&& poblacion % 3 ==0
  }

}
class Pulga inherits Plaga{
  override method poblacion(poblacion_){
    poblacion=poblacion_
  } 
  override method niveldeDaño(){
    return poblacion*2
  }

}

class Garrapata inherits Pulga{
  override method poblacion(poblacion_){
    poblacion=poblacion_
  } 

override method atacar(elemento_){
  super(elemento_)+poblacion%10
}
}