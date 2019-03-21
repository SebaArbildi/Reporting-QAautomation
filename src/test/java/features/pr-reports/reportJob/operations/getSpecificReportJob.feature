Feature: get-reportJob

  Scenario: get report jobs
    * callonce read('classpath:features/pr-reports/reportJob/reportJobUtil.feature')
    When def getOperation = call read('classpath:features/pr-reports/reportJob/operations/getReportJob.feature')
    * def report = getSpecificReportJob(getOperation.response, reportName)
