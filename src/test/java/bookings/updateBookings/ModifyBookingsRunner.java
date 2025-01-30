package bookings.updateBookings;

import com.intuit.karate.junit5.Karate;

public class ModifyBookingsRunner {
    @Karate.Test
    Karate testGetAllBookings() {
        return Karate.run("classpath:bookings/updateBookings/ModifyReservationByID.feature");
    }

}
