Feature: post-job

  Scenario: create a job
    * copy args = __arg
    Given header Authorization = HR_JWT_BEARER
    And url HR_BASE_URL + 'Job'
    And request args
    When method POST
