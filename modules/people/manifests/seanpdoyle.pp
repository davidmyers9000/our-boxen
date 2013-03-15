class people::seanpdoyle {
  $me       = "seanpdoyle"
  $home     = "/Users/${me}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => '${me}/dotfiles',
    require => File[$home]
  }
}