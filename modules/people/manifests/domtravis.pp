class people::domtravis {
  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"
  
  file { $home:
    ensure   => directory
  }

  repository { $dotfiles:
    source   => 'seanpdoyle/dotfiles',
    require  => File[$home]
  }

  # included niceties
  include chrome
  
  include projects::that-spot
  include projects::that-spot-ui
}