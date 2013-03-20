class projects::that-spot {

  boxen::project { 'that-spot':
    dotenv        => true,
    elasticsearch => true,
    postgresql    => true,
    ruby          => '2.0.0',
    source        => 'seanpdoyle/that-spot'
  }
}