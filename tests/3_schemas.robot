*** Settings ***
Library         REST                        localhost:8273
Library         FakerLibrary                WITH NAME   Faker
Test teardown   Clear expectations
Suite teardown  Rest instances              ${OUTPUTDIR}/instances.json


*** Test Cases ***
With valid params
    [Setup]                 Expect response     ${CURDIR}/schemas/valid.json

    :FOR  ${id}  IN RANGE   5                   10
    \   &{params}=          Generate params
    \   PUT                 /users/${id}        ${params}
    \   PATCH               /users/${id}        { "email": "${params.email}" }
    \   GET                 /users/${id}

    :FOR  ${id}  IN RANGE   11                  21
    \   &{params}=          Generate params
    \   ${params.id}=       Input               ${id}
    \   POST                /users              ${params}


With invalid params (id is read-only for PUT and PATCH)
    [Setup]                 Expect response     ${CURDIR}/schemas/invalid.json

    :FOR  ${id}  IN RANGE   15                  31
    \   &{params}=          Generate params
    \   ${params.id}=       Faker.Pyint
    \   PUT                 /users/${id}        ${params}
    \   PATCH               /users/${id}        { "id": "${params.id}" }


With missing params (id is required for POST)
    [Setup]                 Expect response     ${CURDIR}/schemas/invalid.json

    :FOR  ${id}  IN RANGE   30                  41
    \   &{params}=          Generate params
    \   POST                /users              ${params}


*** Keywords ***
Generate params
    &{user}=                        Create Dictionary
    ${user.name}=                   Faker.Name
    ${user.username}=               Faker.User name
    ${user.email}=                  Faker.Email
    ${user.address}=                Create Dictionary
    ${user.address.street}=         Faker.Street address
    ${user.address.city}=           Faker.City
    ${user.address.zipcode}=        Faker.Postcode
    ${user.phone}=                  Faker.Phonenumber
    ${user.website}=                Faker.URL
    ${user.company}=                Create Dictionary
    ${user.company.name}=           Faker.Company
    ${user.company.catchPhrase}=    Faker.Catch phrase
    ${user.company.bs}=             Faker.BS
    [Return]                        ${user}
