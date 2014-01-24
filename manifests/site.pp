require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git

  # dns and proxy
  include dnsmasq
  include nginx

  # terminal
  include zsh
  include asciiio

  # sublime for text editing
  include sublime_text_2
  include dropbox
  include github_for_mac

  # for testing clusters
  include vagrant
  include virtualbox

  include osx::global::expand_save_dialog

  # fail if FDE is not enabled
  # if $::root_encrypted == 'no' {
  #   fail('Please enable full disk encryption and try again')
  # }

  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  $rubyversion = '2.0.0'

  ruby::gem { "rails for ${rubyversion}":
    gem     => 'rails',
    ruby    => $rubyversion
  }

  ruby::gem { "heroku for ${rubyversion}":
    gem     => 'heroku',
    ruby    => $rubyversion
  }

  ruby::gem { "foreman for ${rubyversion}":
    gem     => 'foreman',
    ruby    => $rubyversion
  }

  ruby::gem { "bundler for ${rubyversion}":
    gem     => 'bundler',
    ruby    => $rubyversion
  }

  ruby::gem { "zeus for ${rubyversion}":
    gem     => 'zeus',
    ruby    => $rubyversion
  }

  ruby::gem { "guard for ${rubyversion}":
    gem     => 'guard',
    ruby    => $rubyversion
  }

  git::config::global { [
    'color.diff',
    'color.status',
    'color.branch'
  ]:
    value => 'auto'
  }
  
  git::config::global {'color.ui':
    value => true
  }

  # common, useful packages
  package {
    [
      'ack',
      'coreutils',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
