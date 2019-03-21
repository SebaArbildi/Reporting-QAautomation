Feature: Credentials Manager

  Scenario: Get Credentials
    Given url "http://10.20.2.161:3030/credentialSuite"
    And param _id = param_cred_id
    When method GET
