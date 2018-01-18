*** Settings ***
Library         REST       localhost:8273    spec=${CURDIR}/spec/users_api.json


*** Test Cases ***

### GET ########################################################################

GET to existing
    GET         /users/1

GET to non-existing
    GET         /users/404

GET many
    GET         /users

GET many with query "_limit"
    GET         /users?_limit=10

GET many with invalid query
    GET         /users?_invalid=query

### PUT ########################################################################

POST with invalid params
    POST        /users          { "name": "Alexander James Murphy" }

POST with valid params
    POST        /users          { "id": 100, "name": "Alexander James Murphy" }

POST with missing params
    POST        /users

### PUT ########################################################################

PUT to non-existing
    PUT         /users/2043

PUT with invalid params
    PUT         /users/100      { "id": 1801 }

PUT with valid params
    PUT         /users/100      { "address": { "city": "Delta City" } }

PUT with missing params
    PUT         /users/100

### PATCH ######################################################################

PATCH to non-existing
    PATCH        /users/2043

PATCH with invalid params
    PATCH       /users/100      { "nickname": "murph" }

PATCH with valid params
    PATCH       /users/100      { "username": "murph" }

PATCH with missing params
    PATCH        /users/100

### DELETE #####################################################################

DELETE to non-existing
    DELETE      /users/2043

DELETE to existing
    DELETE      /users/1
