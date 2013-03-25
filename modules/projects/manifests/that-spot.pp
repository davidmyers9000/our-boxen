class projects::that-spot {
  include imagemagick

  exec { 'brew install libtool --universal':
    creates       => "${boxen::config::homebrewdir}/Cellar/libtool",
    require       => Class['homebrew']
  }

  boxen::project { 'that-spot':
    dotenv        => true,
    elasticsearch => true,
    postgresql    => true,
    ruby          => '2.0.0',
    source        => 'seanpdoyle/that-spot'
  }
}