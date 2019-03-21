Feature: post-report

  Scenario: generate reports for a rwz files
    * copy args = __arg
    * def runOptions =
    """
    {
    "Filename": #(args[0].Filename),
    "StartDate": #(args[0].StartDate),
    "StopDate": #(args[0].StopDate),
    "JobId": #(args[1].Id),
    "OutputType": 0
    }
    """

    Given url HR_BASE_URL + 'Report'
    And header Authorization = HR_JWT_BEARER
    And request runOptions
    When method POST
    * call defaultSleep
