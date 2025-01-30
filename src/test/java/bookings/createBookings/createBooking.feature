Feature: Test for create bookings

  Background:
    * url url_booking
    * header Accept = 'application/json'

    @CreateBooking
    Scenario: Create Booking Succesful
      Given path 'booking'
      And def requestBodyJson = read('classpath:bookings/createBookings/RequestBodyCreateBooking.json')
      And request requestBodyJson
      When method POST
      Then status 200
      And match response == read('classpath:bookings/createBookings/ResponseBodyCreateBooking.json')
      And match response == read('classpath:bookings/createBookings/ResponseSchemaCreateBookins.json')


  @ScenarioAltern
  Scenario Outline: Create Booking with incorrect data or missing data
    Given path 'booking'
    And request
  """
  {
    "firstname": <firstname>,
    "totalprice": <totalprice>
  }
  """
    When method POST
    Then status <status>

    Examples:
      | firstname   | totalprice | status |
      | 123         | 123        | 500    |
      | "John"      | 150        | 500    |
      | "John"      | "abc"      | 500    |
#Use un estado de error 500, que es el que arroja el sistema, el servidor envía los mensajes de error incorrectos






