class projects::that-spot-ui {
  include phantomjs
  
  boxen::project { 'that-spot-ui':
    dotenv    => true,
    nodejs    => '0.8',
    ruby      => '2.0.0',
    source    => 'seanpdoyle/that-spot-ui'
  }
}