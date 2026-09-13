Feature: Getting animals from GET API

  Scenario: Validation of positive response code for animals from the Application
    Given i am an authenticated user
    When i hit the get animals api url
    Then i get 200 as the response code


  Scenario: Validation of positive response body animals from the Application
    Given i am an authenticated user
    When i hit the get animals api url
    Then i get animals in the response body of the api


  Scenario: Validation of negative response code for animals from the Application
    Given i am an unauthenticated user
    When i hit the get animals api url
    Then i get 401 as the response code

  Scenario: Validation of negative response body for animals from the Application
    Given i am an unauthenticated user
    When i hit the get animals api url
    Then i do not get animals in the response of the api
