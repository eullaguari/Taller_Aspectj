public aspect VerificarSesion {	
    //@pointcut, es decir, el punto donde ocurrir� la llamada al inicio de sesi�n.
    pointcut callClient(): call(* Clientes.consultar(..)); 
  //Advices. Se ejecutar�n en el lugar indicado por el pointcut.
    before() : callClient() {
        // M�todoInicioSesi�n
    	if(!IniciarSesion.sesionIniciada) {
    		IniciarSesion.initialize();
    		
    	}
    } 
    after() : callClient()  {
        //Ya se inici� sesi�n. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		System.out.println("Sesi�n Iniciada");	;
    		
    	}
    }
}