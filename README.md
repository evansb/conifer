# Conifer

## Abstract
Conifer is an experimental platform that combines real time collaboration
and hot code reloading to support collaborative applications
with programmable entities. 

## Application Structure
Conifer is divided into separate applications

* `collab` provides distributed scalable real time editing of program code using
the CRDT method.
* `world` provides the business logic of programmable entities.
* `api` provides a real-time API using WebSocket and HTTP.

## License
MIT