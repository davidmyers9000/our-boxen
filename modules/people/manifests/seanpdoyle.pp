class people::seanpdoyle {
  $home     = "/Users/seandoyle"
  $dotfiles = "${home}/dotfiles"
  
  file { $home:
    ensure   => directory
  }

  repository { $dotfiles:
    source   => '${home}/dotfiles',
    require  => File[$home]
  }
}