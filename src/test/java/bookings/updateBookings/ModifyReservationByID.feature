Feature: Test For Modify Reservation By ID

  Background:
    * url url_booking
    And header Accept = 'application/json'
    * header Content-Type = 'application/json'


  @HappyPath
  Scenario: Modify Booking by Booking ID Successfully
    Given def authResponse = call read('classpath:bookings/authetication/generatorToken.feature')
    And def authToken = authResponse.response.token
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid
    And header Cookie = 'token=' + authToken
    And def requestDataJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestDataJson
    When method PUT
    Then status 200
    And match response == read('classpath:bookings/updateBookings/ResponseBodyModifyBooking.json')
    And match response == read('classpath:bookings/updateBookings/ResponseSchemaUpdateBooking.json')


  @NegativeCase
  Scenario: Modify Booking with Empty Request Body
    Given def authResponse = call read('classpath:bookings/authetication/generatorToken.feature')
    And def authToken = authResponse.response.token

    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid

    Given path 'booking/' + bookingid
    And header Cookie = 'token=' + authToken
    And request {}
    When method PUT
    Then status 400

  @ScenarioAltern
  Scenario: Modify reservation without authentication
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    Given path 'booking/' + bookingid
    And def requestDataJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestDataJson
    When method PUT
    Then status 403

  @ScenarioAltern
  Scenario: Modify reservation with non-existent ID
    Given def authResponse = call read('classpath:bookings/authetication/generatorToken.feature')
    And def authToken = authResponse.response.token
    Given path 'booking/99999'
    And header Cookie = 'token=' + authToken
    And def requestDataJson = read('classpath:bookings/updateBookings/RequestBodyModifyBooking.json')
    And request requestDataJson
    When method PUT
    Then status 405





