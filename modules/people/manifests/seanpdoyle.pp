class people::seanpdoyle {
  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"
  
  file { $home:
    ensure   => directory
  }

  repository { $dotfiles:
    source   => '${::luser}/dotfiles',
    require  => File[$home]
  }

  # included niceties
  include chrome

  # included projects
  include projects::all
}
