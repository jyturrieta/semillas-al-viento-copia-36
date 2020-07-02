class Planta
{
	var property anioDeObtencion = 0 
	var property altura = 0
	var property horasToleradas = 0 
	method esFuerte()
	{
		return self.horasToleradas() > 9
	}
	
	method daSemillasNuevas()
	{
		return self.esFuerte() 
	}
	
	method espacioQueOcupa()
	{
		
	}
}

class Menta inherits Planta
{
	
}

class Soja inherits Planta
{
	
}

class Quinoa inherits Planta
{
	
}