class projects::fitly-rails {
  include vagrant
  include imagemagick
  include phantomjs
  include chrome
  include firefox
  include libtool

  $project       = 'fitly-rails'
  $home          = "/Users/${::luser}"

  boxen::project { $project:
    nginx         => true,
    redis         => true,
    mysql         => true,
    dotenv        => true,
    ruby          => '2.0.0-p0',
    source        => "fitly/${project}"
  }

  # this is a weird imagemagick versioning fix
  exec { 'brew unlink imagemagick && brew link imagemagick':
    require       => [Class['imagemagick'], Class['homebrew']]
  }

  file { "$home/.ec2/gsg-keypair":
    source        => "puppet:///modules/projects/${project}/gsg-keypair",
    ensure        => present
  }

  file { "$home/.ec2/gsg-keypair.pub":
    source        => "puppet:///modules/projects/${project}/gsg-keypair.pub",
    ensure        => present
  }
}