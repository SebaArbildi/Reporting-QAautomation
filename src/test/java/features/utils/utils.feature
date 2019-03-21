Feature: utility methods, functions and variables

  Scenario: utils
    * def sleep =
      """
      function(seconds){
          java.util.concurrent.TimeUnit.SECONDS.sleep(seconds);
          return seconds;
      }
      """
    * def defaultSleep = sleep(15)
