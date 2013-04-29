class projects::that-spot {
  include imagemagick
  include phantomjs
  include libtool

  $project       = "that-spot"

  # exec { 'brew install libtool --universal':
  #   creates       => "${boxen::config::homebrewdir}/Cellar/libtool",
  #   require       => Class['homebrew']
  # }

  boxen::project { $project:
    dotenv        => true,
    nginx         => true,
    elasticsearch => true,
    postgresql    => true,
    ruby          => '2.0.0',
    source        => "seanpdoyle/$project"
  }
}