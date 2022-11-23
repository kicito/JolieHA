from console import Console
from time import Time

type FetcherParams {
    period: int // interval period for fetching a new data steam in ms
    target: string // location of the data source
}

interface selfIface {
    OneWay:
        fetch( void ) // TODO define request/ response
}

service Fetcher(p : FetcherParams) {
    embed Console as Console
    embed Time as Time
    execution: concurrent

    inputPort selfIP {
        location: "local"
        interfaces: selfIface
    }

    init {
        global.currentTime = 0
        println@Console("fetcher configuration: url= " + p.target + ", period=" + p.period)()
        global.id = scheduleTimeout@Time( p.period {
            .operation= "fetch"
        } )
    }

    main {
        [ fetch() ] {
            println@Console("start fetching data from " + p.target + " from time " + global.currentTime)()
            // TODO: call Janos's lib methods nextTime()

            global.currentTime = getCurrentTimeMillis@Time()
            setNextTimeout@Time(p.period {
                .operation= "fetch"
            } )
        }
    }
}