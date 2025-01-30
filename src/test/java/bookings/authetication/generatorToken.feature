@ignore
Feature: Authentication for Booking API

  Background:
    * url url_booking
    * header Content-Type = 'application/json'
    * path '/auth'

  Scenario: Get authentication token
    Given url 'https://restful-booker.herokuapp.com'
    And def requestBodyJson = read('classpath:bookings/authetication/RequestBodyToken.json')
    And request requestBodyJson
    When method POST
    Then status 200
    #And match response == reade('classpath:bookings/authetication/RequestBodySchemaToken.json')
    And def authToken = response.token
    * print 'Auth token:', authToken



