Feature: report-controller-test

  Background:
    * callonce read('classpath:features/utils/utils.feature')

  @api
  Scenario: generate reports for all rwz files available
    Given def getReportDefinition = call read('classpath:features/hr-reports/reportDefinition/operations/getReportDefinitions.feature')
    When call read('classpath:features/hr-reports/report/createReport.feature') getReportDefinition.response
    Then match postReportResponse.responseStatus == 200
