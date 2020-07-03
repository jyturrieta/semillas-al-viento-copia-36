import parcelas.*

class Planta
{
	var property anioDeObtencion = 0 
	var property altura = 0
	
	method horasToleradas()
	{
		return 7
	}
	
	method esFuerte()
	{
		return self.horasToleradas() > 9
	}
	
	method daSemillasNuevas()
	{
		return self.esFuerte() or self.condicionAlternativa()
	}
	
	method espacioQueOcupa()
	
	method condicionAlternativa()
	
	method leResultaIdeal(unaParcela)
	
	
}

class Menta inherits Planta
{
	override method condicionAlternativa()
	{
		return self.altura() > 0.4
	}
	
	override method espacioQueOcupa()
	{
		return self.altura() * 3
	}
	
	override method leResultaIdeal(unaParcela)
	{
		return unaParcela.superficie() > 6
	}
}

class Soja inherits Planta
{
	override method horasToleradas()
	{
		return if (self.altura() < 0.5)
		{
			6
		}
		else if (self.altura().between(0.5, 1))
		{
			8
		}
		else
		{
			12
		}
	}
	
	override method condicionAlternativa()
	{
		return self.anioDeObtencion() > 2007 and self.altura().between(0.75, 0.9)
	}
	
	override method espacioQueOcupa()
	{
		return self.altura() / 2
	}
	
	override method leResultaIdeal(unaParcela)
	{
		return unaParcela.horasDeSol() == self.horasToleradas()
	}
}

class Quinoa inherits Planta
{
	const property espacioQueOcupa = 0
	
	override method horasToleradas()
	{
		return if (espacioQueOcupa < 0.3)
		{
			10
		}
		else
		{
			super()
		}
		
	}
	
	override method condicionAlternativa()
	{
		return self.anioDeObtencion() < 2005 	
	}
	
	override method leResultaIdeal(unaParcela)
	{
        return unaParcela.plantas().any({p => p.altura() <= 1.5})
    }

	
}

class SojaTransgenica inherits Soja
{
	override method daSemillasNuevas()
	{
		return false
	}
	
	override method leResultaIdeal(unaParcela)
	{
		return unaParcela.cantidadMaximaDePlantas() == 1
	}
}

class Hierbabuena inherits Menta
{
	override method espacioQueOcupa()
	{
		return super() * 2
	}
}


