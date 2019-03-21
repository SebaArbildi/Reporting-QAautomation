Feature: job-utils

  Scenario:
    #implementetion of auxiliar functions
    * def changeAcknowledgedToTrueForAllJobs =
    """
          function(jobs){
            for (var i = 0; i < jobs.length; i++){
              jobs[i].Acknowledged = true;
            }
            return jobs;
          }
    """
