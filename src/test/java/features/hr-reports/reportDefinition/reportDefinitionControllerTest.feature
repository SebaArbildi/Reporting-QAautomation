Feature: report-definition-controller

  Scenario: compare rwz files from api with rwz files from desktopApp
    When call read('operations/getReportDefinitions.feature')
    Then match rwzFilesFromResponse == rwzFilesFromDesktop

  @api
  Scenario: get all hr reports
    When def getOperation = call read('operations/getReportDefinitions.feature')
    Then match getOperation.responseStatus == 200
