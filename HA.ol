interface JolieHAInterface {
    RequestResponse:
    start( void ) ( void ), // TODO define request/ response
    nextTime( void )( void ), // TODO define request/ response
    currentStatus( void )( void ) // TODO define request/ response
}

service JolieHA {
	inputPort Input {
		location: "local"
		interfaces: JolieHAInterface
	}

	foreign java {
		class: "joliex.ha.JolieHA"
	}
}