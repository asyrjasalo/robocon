# RoboCon 2018 presentation

## Towards contract-based API testing with a new REST JSON test library

The web has become increasingly UX driven. While this is great,
it pressures API developers to keep up with the frontend needs
for real like data - far earlier than the APIs are final and out.

This has led to the rise of contract-first API design,
where e.g. OpenAPI specification (formerly "Swagger") is used to describe
what *kind of* data is (not) expected. Already established open source tools
also allow generating both stubs and mock APIs quite automatically from these
contracts.

Contracts ease in keeping the UI, the APIs and the tests in sync,
as they handle data based on the same schema. In addition to being a common
language between developers and testers, it states to others how they can
integrate to your APIs.

HTTP, REST and JSON are prone to exist for years to come - as well as
Robot Framework's natural language approach. We are happy to present you a new,
yet unnamed, test library for validating response JSON objects,
but also testing that the requests follow the contract.


*Anssi Syrjäsalo is a Siili technologist and a spare time open source developer.
Influenced by robots from an early age, and since increasingly by humans,
his mission is in turning daily repetitive workflows into automation tools,
hoping to make your work a little less mechanical. He is a former Robot
Framework core developer and has done tooling as products too (e.g. Deveo, now part of Perforce).*


## Robot Framework test library for (RESTful) JSON APis

- **RESTinstance** [at GitHub](https://github.com/asyrjasalo/RESTinstance) / [Python package at PyPi](https://pypi.python.org/pypi/RESTinstance)

## Replay

    ./presentation

## Really? Replay.

- [At YouTube](https://www.youtube.com/watch?v=TMU4WCIq3NA)

## My related tools, mentioned in the presentation

- **rfdocker** [at GitHub](https://github.com/asyrjasalo/rfdocker) / [at DockerHub](https://hub.docker.com/r/robotframework/rfdocker)

- **mounterest** [at GitHub](https://github.com/asyrjasalo/mounterest) / [at DockerHub](https://hub.docker.com/r/asyrjasalo/mounterest)
