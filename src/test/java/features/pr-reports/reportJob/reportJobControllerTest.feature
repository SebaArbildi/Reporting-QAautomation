@api
Feature: reportJob-controller

  Scenario: get all pr reports
    When def getOperation = call read('operations/getReportJob.feature')
    Then match getOperation.responseStatus == 200

  Scenario: get TFM-JRNL DELETIONS pr report
    When def getReport = call read('operations/getSpecificReportJob.feature') {reportName: 'TFM-JRNL DELETIONS'}
    Then match getReport.report != null
