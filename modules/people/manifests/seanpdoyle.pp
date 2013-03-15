class people::seanpdoyle {
  $home     = "/Users/seandoyle"
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

  # included projects
  include projects::that-spot
  include projects::that-spot-ui
}