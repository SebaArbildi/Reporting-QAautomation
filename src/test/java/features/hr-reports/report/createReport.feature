Feature: create-report

  Scenario: create report
    * copy args = __arg
    * def newJob =
    """
    {
      "Id":0
    }
    """
    Given def postJobResponse = call read('classpath:features/job/operations/postJob.feature') newJob
    When def postReportResponse = karate.call('classpath:features/report/operations/postReport.feature', [args, postJobResponse.response])
