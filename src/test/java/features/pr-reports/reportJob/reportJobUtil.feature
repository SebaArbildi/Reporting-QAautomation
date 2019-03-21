Feature: reportJob-utils

  Scenario:
    #implementetion of auxiliar functions
    * def getSpecificReportJob =
    """
          function(response, fileDescription){
            var specificReportJob = null;
            var i = 0;
            var found = false;
            while (i < response.length && !found){
              if(response[i].fileDescription == fileDescription){
                 specificReportJob = response[i];
                 found = true;
              }
              i++;
            }
            return specificReportJob;
          }
    """
