class people::seanpdoyle {
  include chrome
  
  $me       = "seanpdoyle"
  $home     = "/Users/${me}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => '${me}/dotfiles',
    require => File[$my]
  }
}