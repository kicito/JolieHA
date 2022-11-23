from .fetcher import Fetcher, FetcherParams
from console import Console
from .HA import JolieHA

type Params {
	name: string
	queries* {
		_* {
			name: string
		}
	}
	dbConnection: string
	fetcher: FetcherParams
	acceptLocation: string
}

interface inputInterface {
    RequestResponse:
        currentStatus( void )( undefined ) // TODO define request/ response
}

service Main( p:Params ) {

	embed Fetcher(p.fetcher) as Fetcher
	embed Console as Console
	
	inputPort op {
		location: p.acceptLocation
		protocol: http {
			osc.currentStatus << {
				template = "/status"
				method = "get"
			}
			format = "json"
		}
		interfaces: inputInterface
	}
	
	execution: concurrent

    init {
        println@Console("HARP: " + p.name + " is listening on " + p.acceptLocation)()
    }

	main {
        [ currentStatus()(res){
            res.name = p.name
            for ( q in p.queries){
                res.queries[#res.queries] << q
            }
            // TODO: query database and assigned to res.status;
        }]
	}
}