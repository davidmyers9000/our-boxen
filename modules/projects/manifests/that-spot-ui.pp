class projects::that-spot {
  include phantomjs

  boxen::project { 'that-spot-ui':
    nodejs    => '0.8.0',
    ruby      => '2.0.0',
    source    => 'seanpdoyle/that-spot-ui'
  }
}