function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    url_booking: 'https://restful-booker.herokuapp.com',
    url_cars: 'https://cars.com'
  }
  if (env == 'dev') {
  config.url_booking = 'https://restful-booker.herokuapp.com';
  } else if (env == 'qa') {
    config.url_booking = 'https://restful-booker.herokuapp.com'
  }
  return config;
}