*** Settings ***
Library         REST                        localhost:8273
Variables       responses/user4.py
Test teardown   Output  response body
#Test teardown   Output  request body


*** Test Cases ***
GET existing user
    GET         /users/1
    Integer     response status             200
    Integer     response body id            1
    String      response body name          Leanne Graham

GET non-existing user
    GET         /users/1969
    Integer     response status             404
    String      response body error         Not found

GET many users
    GET         /users?_limit=3             timeout=1.5
    Integer     response body 2 id          3
    GET         /users/                     { "_limit": 3 }
    Array       response body               ${CURDIR}/responses/limit_3.json

POST with invalid params
    POST        /users/11                   { "name": "John Galt" }
    Integer     response status             400
    String      response body error         No property 'id' given

PUT with valid params
    PUT         /users/2                    { "isCoding": true }
    Boolean     response body isCoding      true
    PUT         /users/2                    { "sleep": null }
    Null        response body sleep
    PUT         /users/2                    { "pockets": "", "money": 0.02 }
    String      response body pockets       ${EMPTY}
    Number      response body money         0.02
    Missing     response body moving

PATCH with valid params
    GET         /users/3
    String      response body name          Clementine Bauch
    PATCH       /users/3                    { "name": "Julie Langford" }
    String      response body name          Julie Langford

DELETE existing
    GET         /users/4
    Object      response body               ${user4}
    DELETE      /users/4
    Integer     response status             200     204
    GET         /users/4
    Integer     response status             404
