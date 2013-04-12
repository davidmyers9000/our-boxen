class people::domtravis {
  # included projects
  include projects::all
  
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
}