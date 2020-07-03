import plantas.*

class Parcela  
{
	var property ancho
	var property largo
	var property horasDeSol = 0 
	var property plantas = []	
	
	method superficie()
	{
		return self.largo() * self.ancho()
	}
	
	method cantidadMaximaDePlantas()
	{
		return if (self.ancho() > self.largo())
		{
			self.superficie() / 5
		}
		else
		{
			self.superficie() / 3 + self.largo()
		}
	}
	
	method alturaDeLasPlantas()
	{
		return plantas.map({planta => planta.altura()})
	}
	
	method tieneSangreJoven()
	{
		return plantas.any({p => p.anioDeObtencion() > 2012})
	}
	
	method plantarUnaPlanta(unaPlanta)
	{
		if (plantas.size() == self.cantidadMaximaDePlantas() or 
			(self.horasDeSol() - unaPlanta.horasToleradas() > 2))
		{
			self.error("excedió la capacidad maxima o la planta no tolera tanto sol")
		}
		else
		{
			plantas.add(unaPlanta)
		}
	}
	
	method cantidadDePlantas()
	{
		return plantas.size()
	}
	
	method cantidadDeBienAsociadas()
	{
		return plantas.count({planta => self.seAsociaBienCon(planta)})
	}
	
	method porcentajeDeBienAsociadas()
	{
		return self.cantidadDeBienAsociadas() * 100 / self.cantidadDePlantas()
	}
	
	
	method seAsociaBienCon(unaPlanta)
	
}

class Ecologica inherits Parcela
{
	override method seAsociaBienCon(unaPlanta)
	{
		return self.tieneSangreJoven() and unaPlanta.leResultaIdeal(self)
	}
}

class Industrial inherits Parcela
{
	override method seAsociaBienCon(unaPlanta)
	{
		return plantas.size() <= 2 and unaPlanta.esFuerte()
	}
}