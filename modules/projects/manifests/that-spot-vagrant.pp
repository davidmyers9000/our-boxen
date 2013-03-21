class projects::that-spot-vagrant {
  include vagrant

  boxen::project { 'that-spot-vagrant':
    ruby          => '2.0.0',
    source        => 'that-spot/that-spot-vagrant'
  }

# vagrant box add heroku http://dl.dropbox.com/u/1906634/heroku.box --provider=virtualbox

  # vagrant::box { 'heroku':
  #   ensure => present,
  #   url    => 'http://dl.dropbox.com/u/1906634/heroku.box',
  # }
}