class people::davidmyers9000 {
  # included projects
  include projects::all

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"
  
  file { $home:
    ensure   => directory
  }

  repository { $dotfiles:
    source   => 'davidmyers9000/dotfiles',
    require  => File[$home]
  }

  git::config::global { 'user.name':
    value => 'David Myers'
  }

  git::config::global { 'user.email':
    value => 'davidmyers9000@gmail.com'
  }
}