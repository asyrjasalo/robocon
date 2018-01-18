*** Settings ***
Library         REST       http://localhost:2525
Library         Collections
Suite setup     Create proxy in mountebank
#Suite teardown  Delete proxy in mountebank

*** Variables ***
${api_port}=                8080

*** Keywords ***
Create proxy in mountebank
    &{imposter}=  Input     { "name": "proxy to live jsonserver", "protocol": "http", "port": ${api_port}, "stubs": [] }
    ${proxy}=     Input     ${CURDIR}/proxy.json
    Append to list          ${imposter.stubs}   ${proxy}
    POST                    /imposters          ${imposter}

Delete proxy in mountebank
    DELETE                  /imposters/${api_port}
