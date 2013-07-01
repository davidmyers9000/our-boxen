class projects::fitly-rails {
  include vagrant
  include imagemagick
  include phantomjs
  include chrome
  include firefox
  include libtool

  $project       = "fitly-rails"

  boxen::project { $project:
    nginx         => true,
    redis         => true,
    mysql         => true,
    ruby          => '2.0.0-p0',
    source        => "fitly/$project"
  }

  # this is a weird imagemagick versioning fix
  exec { 'brew unlink imagemagick && brew link imagemagick':
    require       => [Class['imagemagick'], Class['homebrew']]
  }
}