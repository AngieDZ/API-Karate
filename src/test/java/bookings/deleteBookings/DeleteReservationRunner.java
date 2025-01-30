package bookings.deleteBookings;

import com.intuit.karate.junit5.Karate;

public class DeleteReservationRunner {
    @Karate.Test
    Karate testDeleteBookings() {
        return Karate.run("classpath:bookings/deleteBookings/DeleteReservation.feature");
    }
}
