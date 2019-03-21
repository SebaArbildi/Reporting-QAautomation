Feature: get-report-definitions

  Scenario: compare rwz files from api with rwz files from desktopApp
    * callonce read('classpath:features/hr-reports/reportDefinition/reportDefinitionUtils.feature')
    Given url HR_BASE_URL + 'ReportDefinition'
    And header Authorization = HR_JWT_BEARER
    When method GET
    * def rwzFilesFromResponse = getRwzFilesFromResponse(response)
    * def rwzFilesFromDesktop = ReportDefinition.getRwzFilesFromDesktop()
