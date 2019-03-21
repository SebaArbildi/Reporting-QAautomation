Feature: get-job

  Scenario: get all jobs
    * copy args = __arg
    Given url HR_BASE_URL + 'Job'
    And header Authorization = HR_JWT_BEARER
    And param active = args[0]
    And param jobType = 1
    When method GET
