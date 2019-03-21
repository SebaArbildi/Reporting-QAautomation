Feature: reportDefinition-utils

  Scenario:
    #definition of java classes
    * def ReportDefinition = Java.type('controllers.ReportDefinition')

    #implementetion of auxiliar functions
    * def getRwzFilesFromResponse =
    """
          function(response){
            var rwzFilesFromResponse = [];
            for (var i = 0; i < response.length; i++){
              rwzFilesFromResponse[i] = response[i].Filename;
            }
            return rwzFilesFromResponse.sort();
          }
    """
