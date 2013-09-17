class projects::davidmyers9000-github-com {
  $project       = 'davidmyers9000.github.com'
  $home          = "/Users/${::luser}"

  boxen::project { $project:
    dotenv        => true,
    ruby          => '2.0.0-p0',
    source        => "${project}"
  }
}