package bookings.authetication;

import com.intuit.karate.junit5.Karate;

public class GeneratorTokenRunner {

    @Karate.Test
    Karate testGeneratorToken(){
        return Karate.run("classpath:bookings/authetication/generatorToken.feature");
    }

}
