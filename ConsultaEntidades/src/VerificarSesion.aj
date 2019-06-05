public aspect VerificarSesion {	
    //@pointcut, es decir, el punto donde ocurrirá la llamada al inicio de sesión.
    pointcut callClient(): call(* Clientes.consultar(..)); 
  //Advices. Se ejecutarán en el lugar indicado por el pointcut.
    before() : callClient() {
        // MétodoInicioSesión
    	if(!IniciarSesion.sesionIniciada) {
    		IniciarSesion.initialize();
    		
    	}
    } 
    after() : callClient()  {
        //Ya se inició sesión. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		System.out.println("Sesión Iniciada");	;
    		
    	}
    }
}