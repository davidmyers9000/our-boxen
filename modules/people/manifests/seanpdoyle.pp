class people::seanpdoyle {
  # included projects
  include projects::all

  $home     = "/Users/seanpdoyle"
  $dotfiles = "${home}/.dotfiles"
  
  file { $home:
    ensure   => directory
  }

  repository { $dotfiles:
    source   => 'seanpdoyle/dotfiles',
    require  => File[$home]
  }

  git::config::global { 'user.name':
    value => 'Sean Doyle'
  }

  git::config::global { 'user.email':
    value => 'sean.p.doyle24@gmail.com'
  }

  boxen::osx_defaults { 'finder should show hidden icons':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'AppleShowAllFiles',
    value  => true
  }

  boxen::osx_defaults { "don't show dock as a space":
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'dashboard-in-overlay',
    value  => false
  }

  boxen::osx_defaults { 'disable dashboard':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.dashboard',
    key    => 'mcx-disabled',
    value  => true
  }

  boxen::osx_defaults { 'hide useless menu icons':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.systemuiserver',
    key    => 'menuExtras',
    value  => [
      '/System/Library/CoreServices/Menu Extras/Bluetooth.menu',
      '/System/Library/CoreServices/Menu Extras/AirPort.menu', 
      '/System/Library/CoreServices/Menu Extras/Battery.menu', 
      '/System/Library/CoreServices/Menu Extras/Clock.menu'
    ]
  }

  boxen::osx_defaults { 'always show scrollbars':
    ensure => present,
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleShowScrollBars',
    value  => 'Always'
  }

  boxen::osx_defaults { 'check for software updates daily':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.SoftwareUpdate',
    key    => 'ScheduleFrequency',
    value  => 1
  }

  # Trackpad Configuration
  boxen::osx_defaults { 'disable tap to click':
    ensure => present,
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    value  => 0
  }

  boxen::osx_defaults { 'disable "natural" style scrolling':
    ensure => present,
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.swipescrolldirection',
    value  => false
  }

  boxen::osx_defaults { 'enable full keyboard tabbing':
    ensure => present,
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3
  }

  boxen::osx_defaults { 'top-right for all windows':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'wvous-tr-corner',
    value  => 3
  }

  boxen::osx_defaults { 'top-right modifier for all windows':
    ensure => present,
    user   => $::boxen_user,
    domain => 'com.apple.dock',
    key    => 'wvous-tr-modifier',
    value  => 0
  }
}
