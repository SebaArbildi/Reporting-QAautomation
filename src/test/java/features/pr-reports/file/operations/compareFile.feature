Feature: get-file

  Scenario: get file
    Given url PR_BASE_URL + 'directory/' + PR_DIRECTORY +'/files'
    And header Authorization = PR_JWT_BEARER
    And path fileName
    And param outputType = 'PDF'
    When method GET
    * def apiReport = File.getApiReport(response, fileName)
    * def instapayReport = File.getDesktopReport(fileName)
