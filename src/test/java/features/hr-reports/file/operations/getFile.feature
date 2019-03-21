Feature: get-file

  Scenario: get file
    * copy args = __arg
    Given url HR_BASE_URL + 'File'
    And header Authorization = HR_JWT_BEARER
    And path args.Output
    When method GET
