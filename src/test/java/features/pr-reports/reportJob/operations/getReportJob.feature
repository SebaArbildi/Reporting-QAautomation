Feature: get-reportJob

  Scenario: get report jobs
    Given url PR_BASE_URL + 'directory/' + PR_DIRECTORY +'/reportJobs'
    And header Authorization = PR_JWT_BEARER
    When method GET
