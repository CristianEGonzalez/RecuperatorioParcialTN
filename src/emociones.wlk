class Emocion{
	var intensidad
	const property color

	method intensidad() = intensidad
	
	method intensidad(cantidad){
		intensidad += cantidad
	}
	
	method puedeLiberarse() = intensidad >= liberacion.valor()
	
	method expresarEmocion(){
		if (self.puedeLiberarse()){
			self.disminuirIntensidad()
		}
	}
	
	method disminuirIntensidad()
	
	method esEmocionPromedio() = intensidad.between(50,75)
	
}

object liberacion{
	var property valor = 75
}

class Furia inherits Emocion{
	const property palabrotas = []
//	const coloresPosibles = ["rojo", "naranja", "rosa", "cereza"] //Colores por los cuales se puede representar
	
	method aprender(unaPalabrota){palabrotas.add(unaPalabrota)}
	
	override method puedeLiberarse() =  super() and self.conocePalabrotaLarga()
	
	override method disminuirIntensidad(){
			intensidad -= self.letrasDePalabrotaMasLarga()
	}
	
	method conocePalabrotaLarga() = palabrotas.any({ p => p.length() >= 7 })
	
	method letrasDePalabrotaMasLarga() = palabrotas.max({ p => p.length() }).length()
	
	//Parte 3
	method efecto(unEvento){
		intensidad += unEvento.impacto() * 1.5
	}
}

class Alegria inherits Emocion{
	var acontecimientosPositivos = 0
//	const coloresPosibles = ["verde", "esmeralda", "lima", "menta"]
//	method sucederAcontecimientos(cantidad){100.min(acontecimientosPositivos += cantidad)}
	
	method acontecimientosPositivos() = acontecimientosPositivos
	
	override method puedeLiberarse() =  super() or self.acontecimientosPares()
	
	method acontecimientosPares() = (acontecimientosPositivos % 2) == 0
	
	override method disminuirIntensidad(){
			intensidad -= intensidad * (acontecimientosPositivos / 100)
	}
	
	//Parte 3
	method efecto(unEvento){
		intensidad += unEvento.impacto()
		acontecimientosPositivos += 1
	}
}

class Tristeza inherits Emocion{
	var melancolia //true o false
	var llorona //true o false
//	const coloresPosibles = ["azul", "celeste", "marino", "zafiro"]
	
	override method puedeLiberarse() = melancolia or llorona
	
	override method disminuirIntensidad(){
			intensidad = intensidad - if(color == "azul") 10 else 5
	}
	
	//Parte 3
	method efecto(unEvento){
		intensidad += unEvento.impacto() / 2
		melancolia = true
		llorona = true
	}
	
}