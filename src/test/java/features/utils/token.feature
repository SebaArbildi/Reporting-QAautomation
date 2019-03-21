Feature: Authentication API JWT

  Scenario: Set HR Authorization Bearer Token
    * def JWT_GENERATOR = Java.type('com.ascentis.automation.utils.JWTGenerator')
    * def PAYLOAD_BEARER =
    """
    {
       "iss": "ascentis",
       "aud": "all",
       "sub": #(USER_CREDS.username),
       "tid": #(PROD_CRED.dbname),
       "acc": {
         "71": "F"
       },
       "sid": "sid_123",
       "cid": "6"
    }
    """
    * def HR_JWT_BEARER = JWT_GENERATOR.createBearerToken(PAYLOAD_BEARER)

  Scenario: Set PR Authorization Bearer Token
    * def JWT_GENERATOR = Java.type('com.ascentis.automation.utils.JWTGenerator')
    * def USER_COMPLETE_NAME = USER_CREDS.lastname + ", " + USER_CREDS.name
    * def PAYLOAD_BEARER =
    """
    {
       "iss": "ascentis",
       "aud": "all",
       "sub": #(USER_CREDS.username),
       "tid": #(PROD_CRED.dbname),
       "sid": "sid_123",
       "cid": 6,
       "usr": #(USER_COMPLETE_NAME)
    }
    """
    * def PR_JWT_BEARER = JWT_GENERATOR.createBearerToken(PAYLOAD_BEARER)
