class ChooseOption
  def initialize
    @app = App.new
  end

  def choose_option(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_music_albums
    when 3
      @app.list_all_movies
    when 4
      @app.list_all_games
    when 5
      @app.list_all_genres
    when 6
      @app.list_all_labels
    when 7
      @app.list_all_authors
    when 8
      @app.list_all_sources
    when 9
      @app.add_book
    when 10
      @app.add_music_album
    when 11
      @app.add_movie
    when 12
      @app.add_game
    when 13
      puts 'Thank you for using our app!'
      exit
    else
      puts 'That is not a valid option'
    end
  end
end
