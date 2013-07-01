class projects::fitly-mockups {
  $project       = "fitly-mockups"

  boxen::project { $project:
    source        => "fitly/$project"
  }
}