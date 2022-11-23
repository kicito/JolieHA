# Jolie wrapper for Hypothetical Answers

This repository contains jolie service with Hypothetical Answers application.

## Architecture

```mermaid
graph LR
  subgraph HARP
    direction TB
    main{{main.ol}}
    JolieHA{{JolieHA}}
    HA{{HA}}
    fetcher{{fetcher.ol}}
    main -- currentStatus --> JolieHA
    main -.-> JolieHA
    main -.-> fetcher -- nextTime --> JolieHA
    JolieHA -.-> HA
    HA -- writes --> data
    data[(DB)]
  end
  client(client)
  preprocessor(preprocessor)
  client--http-->main
  fetcher--http-->preprocessor
```


## Available parameter

```json
{
    "name": "", // name of the instance
    "queries": [
        {"name": "queryname"}
    ], // arrays of available queries
    "fetcher": {
        "target": "", // destination to poll data from
        "period": 1000 // interval period for each call (in ms)
    },
    "dbConnection": "dbconnectionstring", // database connection for HA / for currentStatus operation
}
```

## Usage

```bash
$ mvn install // complies Javaservice
$ npm run start // launch the program
```
