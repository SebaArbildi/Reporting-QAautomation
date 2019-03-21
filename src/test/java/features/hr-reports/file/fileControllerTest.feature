Feature: file-controller-test

  Background:
    * callonce read('classpath:features/hr-reports/file/fileUtils.feature')

  Scenario: print and compare web and desktop reports for all jobs available
    Given def getJob = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [true])
    When call read('classpath:features/hr-reports/file/operations/compareFile.feature') getJob.response

  @api
  Scenario: print all reports
    Given def getJob = karate.call('classpath:features/hr-reports/job/operations/getJob.feature', [true])
    When call read('classpath:features/hr-reports/file/operations/getFile.feature') getJob.response
