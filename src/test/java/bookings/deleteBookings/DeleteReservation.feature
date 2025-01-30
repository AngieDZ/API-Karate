Feature: Test to eliminate reservations

  Background:
    * url url_booking
    And header Accept = 'application/json'
    * header Content-Type = 'application/json'
    * def authResponse = call read('classpath:bookings/authetication/generatorToken.feature')
    * def authToken = authResponse.response.token
    * header Cookie = 'token=' + authToken

  @HappyPath
  Scenario: Delete an existing reservation
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid
    And header Cookie = 'token=' + authToken
    When method DELETE
    Then status 201

  @ScenarioAltern
  Scenario: Delete reservation without authentication
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid
    When method DELETE
    Then status 201




