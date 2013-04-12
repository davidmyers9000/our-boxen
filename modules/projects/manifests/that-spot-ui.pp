class projects::that-spot-ui {
  # browsers
  include chrome
  include firefox
  include phantomjs

  $bindir = '/usr/local/bin'

  file { $bindir:
    ensure  => directory,
  }

  # Karma test runner expects the phantomjs bin to be here
  file { "${bindir}/phantomjs":
    ensure => link,
    target => "${boxen::config::homebrewdir}/bin/phantomjs",
    require => [Package['phantomjs'], File[$bindir]]
  }

  ruby::gem { 'compass for 2.0.0':
    gem     => 'compass',
    ruby    => '2.0.0'
  }
  
  boxen::project { 'that-spot-ui':
    dotenv    => true,
    nodejs    => 'v0.10.3',
    ruby      => '2.0.0',
    source    => 'seanpdoyle/that-spot-ui'
  }
}