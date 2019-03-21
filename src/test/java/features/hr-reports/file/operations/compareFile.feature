Feature: compare-files

  Scenario: compare files
    * copy args = __arg
    Given url HR_BASE_URL + 'File'
    And header Authorization = HR_JWT_BEARER
    And path args.Output
    When method GET
    * def apiReport = File.getApiReport(response, args.Output)
    * def desktopReport = File.getDesktopReport(args.ResourceId)
    Then match apiReport == desktopReport
