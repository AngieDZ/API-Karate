Feature: Tests for all get bookings

  Background:
    * url url_booking
    * header Accept = 'application/json'


  @HappyPath
  Scenario: Get All Bookings Successful
    Given path 'booking'
    When method GET
    Then status 200
    And match response[0].bookingid == "#number"

  @HappyPath
  Scenario: Validate details of a reservation by ID
    Given path 'booking' , '10'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response contains { firstname: '#string', lastname: '#string', totalprice: '#number', depositpaid: '#boolean', bookingdates: { checkin: '#string', checkout: '#string'}}
    * def actualFirstname = response.firstname
    * print 'El valor dinámico de firstname es:', actualFirstname
    * match actualFirstname == '#string'
    * print 'Respuesta completa:', response

    #Reto 1 mejorado
  @HappyPath
  Scenario: Validate details of a reservation by ID
    Given def createBooking = call read('classpath:bookings/createBookings/createBooking.feature@CreateBooking')
    And def bookingid = createBooking.response.bookingid
    And path 'booking/' + bookingid
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response == read('classpath:bookings/getBookings/ResponseBodyGetBooking.json')
    And match response == read('classpath:bookings/getBookings/ResponseSchemaGetBooking.json')

  @ScenarioAltern
  Scenario: Get reservation with non-existing ID
    Given path 'booking/99999'
    When method GET
    Then status 404

  @ScenarioAltern
  Scenario: Get reservation with invalid ID
    Given path 'booking/abc'
    When method GET
    Then status 404




