@api
Feature: job-controller

  Background:
    * callonce read('classpath:features/hr-reports/job/jobUtils.feature')

  Scenario: get all inactive jobs
    When def getJobsResponse = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [false])
    Then match getJobsResponse.responseStatus == 200

  Scenario: create a job
    Given def newJob =
    """
    {
      "Id":0,
      "JobType": 1
    }
    """
    When def postJobResponse =  call read('operations/postJob.feature') newJob
    Then def getJobsResponse = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [false])
    And match getJobsResponse.response[*].Id contains postJobResponse.response.Id

  Scenario: Acknowledged active jobs
    Given def getActiveJobsResponseBefore = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [true])
    And def getActiveJobsResponseBeforeEdited = changeAcknowledgedToTrueForAllJobs(getActiveJobsResponseBefore.response)
    When def postActiveJobResponse =  call read('operations/postJob.feature') getActiveJobsResponseBeforeEdited
    Then def getActiveJobsResponseAfter = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [true])
    And match each getActiveJobsResponseAfter.response[*].Acknowledged == true
