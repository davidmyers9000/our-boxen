class projects::that-spot-ui {
  
  boxen::project { 'that-spot-ui':
    nodejs    => '0.8',
    ruby      => '2.0.0',
    source    => 'seanpdoyle/that-spot-ui'
  }
}