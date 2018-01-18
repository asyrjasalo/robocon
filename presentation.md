%title: Towards contract-based API testing with a new REST JSON test library
%author: Anssi Syrjäsalo, Siili_
%date: 2018-01-18









-> Towards contract-based API testing with a new REST JSON test library <-
==========================================================================


-> Anssi Syrjäsalo <-
-> Siili <-

--------------------------------------------------------------------------------


-> ## whoami <-


  Past
  \ - Professional software development since 2010
  \   - Robot Framework: core (2.8), SSHLibrary 2, DbBot, rfdocker
  \   - Heavily product development (Deveo, Verkkokauppa.com, Holvi)

  Present
  \ - Currently QA on payments automation
  \ - Targeting to being a better open source contributor day by day

  Why QA/testing?
  \ - It is HARD
  \   - Often working on less resources than shiny-and-new development
  \   - The biggest single factor that affects the end user experience

--------------------------------------------------------------------------------


-> ## JSON API testing challenges <-


  1. No good free API testing tool exists
  \ - Fragmentation: Languages and frameworks have their own
  \   -> Rather rely on long-persisting tech (HTTP, JSON, Robot Framework)

  2. The age of microservices and service-focused teams
  \   - Leads to overusing stubs and fake objects for integration tests
  \     - Maintenance burden to keep them up-to-date with the real
  \ -> Tests to act as an agreement between frontend/backend/testers

  3. The Robot Framework meetup proceedings
  \ - Usually: requestslibrary + jsonlibrary + Collections
  \   - Works, but very misleading error messages for JSON validating
  \   - Eventually start embedding Python -> hard to read, worsens UX

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------




  ██████╗ ███████╗███████╗████████╗
  ██╔══██╗██╔════╝██╔════╝╚══██╔══╝
  ██████╔╝█████╗  ███████╗   ██║
  ██╔══██╗██╔══╝  ╚════██║   ██║
  ██║  ██║███████╗███████║   ██║
  ╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝

  ██╗███╗   ██╗███████╗████████╗ █████╗ ███╗   ██╗ ██████╗███████╗
  ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗████╗  ██║██╔════╝██╔════╝
  ██║██╔██╗ ██║███████╗   ██║   ███████║██╔██╗ ██║██║     █████╗
  ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║╚██╗██║██║     ██╔══╝
  ██║██║ ╚████║███████║   ██║   ██║  ██║██║ ╚████║╚██████╗███████╗
  ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝

  Robot Framework test library for (RESTful) JSON APIs

--------------------------------------------------------------------------------

--------------------------------------------------------------------------------


-> ## The feedback loop <-


  "This confirmed it was not my JavaScript code typing it wrong!"

  Preferably not test for values
  \ - Values are more of examples - they just bring concretics to us
  \ - They are prone change -> end up with a lot of test maintenance

  What about the test-driven development?
  \ - Put the middle D back to TDD - the tests are also the design


--------------------------------------------------------------------------------


-> ## Proceedings <-


  Towards a more declarative testing approach:
  \ - "The password (hash) is never be exposed via this API"
  \ - "If user changes details the timestamp should be updated"
  \ - "And btw the timestamp should be in ISO 8601 format"
  \ - "The amount of money is represented in cents as an integer"


> "JSON Schema has several purposes, one of which is [JSON] validation."
>> "Describes schema keywords dedicated to validation purposes."

  Internet Engineering Task Force
  _http://json-schema.org/draft-04/json-schema-validation.html_ (2013)

  RESTinstance generates request and response jsonschema automatically
  \ - You write the tests -> it gets more accurate

--------------------------------------------------------------------------------

-------------------------------------------------------------------------------


-> ## What about Swagger/OpenAPI? <-


  Originally "Swagger", OpenAPI since 2016
  \ - Language-agnostic API specification (JSON or YAML)
  \   - Allowed API paths, their body params, all possible responses, ...
  \   - Basically: How the API works (without revealing the internals)
  \ - Bases on JSON Schema with additions
  \ - Open API Initiative (Google, IBM, Microsoft, ...)
  \   - July 2017: OpenAPI 3.0

  RESTinstance uses Flex (by Piper Merriam) for swagger 2.0 validation

--------------------------------------------------------------------------------

-------------------------------------------------------------------------------


-> ## What's next <-


  Now:
  \ - For 1.0.0: TODO documentation - via examples
  \ - Support for YAML inputs, in addition to JSON
  \   - Easier for humans to read and write

  Later:
  \ - Generating API spec from tests (similarly as for JSON Schema)

--------------------------------------------------------------------------------


-> ## My recent related projects <-


  rfdocker (Oct 2017)
  \ - Distributing Robot Framework and libs a more portable way
  \   - Tackle conflicting libraries, or Pythons, on the host

  mounterest (NodeJS)
  \ - Bases on Mountebank - "over the wire test doubles"
  \ - Provides fake doubles on the fly for live production apis
  \ - Data as a Service: POST a JSON Schema, GET test params back


--------------------------------------------------------------------------------





-> Thank You and Robot Framework! <-


->  *https://github.com/asyrjasalo/RESTinstance* <-
->  *https://pypi.python.org/pypi/RESTinstance* <-

->  *https://github.com/asyrjasalo/robocon* <-

->  (https://github.com/asyrjasalo/rfdocker) <-
->  (https://github.com/asyrjasalo/mounterest) <-

-> asyrjasalo @ Twitter <-
