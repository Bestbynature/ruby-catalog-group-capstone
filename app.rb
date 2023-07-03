require_relative 'file_loader'
require_relative 'file_saver'
require_relative 'book'
require_relative 'music_album'
require_relative 'movie'
require_relative 'game'
require_relative 'genre'
require_relative 'label'
require_relative 'author'
require_relative 'source'
require_relative 'app_helper'

require 'json'

class App
  attr_accessor :genres, :labels, :authors, :sources, :items

  def initialize
    @fileloader = FileLoader.new
    @genres = @fileloader.load_all_genres
    @labels = @fileloader.load_all_labels
    @authors = @fileloader.load_all_authors
    @sources = @fileloader.load_all_sources
    @items = @fileloader.load_all_items
    @app_helper = AppHelper.new(@genres, @labels, @authors, @sources, @items)
    @file_saver = FileSaver.new(@genres, @labels, @authors, @sources, @items)
  end

  def list_items(items, item_type, item_name)
    items_found = false
    if items.length.positive?
      puts "List of all #{item_name}s in the catalog:"
      puts '-------------------------------------'
      count = 1
      items.each do |item|
        next unless item.is_a?(item_type)

        items_found = true

        puts "#{count}). ID: #{item.id}, Title: #{item.title}, Genre: #{item.genre_name}, Color: #{item.color}, " \
             "Author_First: #{item.author_first_name}, Author_Last: #{item.author_last_name}, " \
             "Published_date: #{item.publish_date}"
        count += 1
      end
    else
      puts 'No items found'
    end
    puts "No #{item_name}s found" unless items_found
  end

  def list_all_books
    list_items(@items, Book, 'book')
  end

  def list_all_music_albums
    list_items(@items, MusicAlbum, 'music album')
  end

  def list_all_movies
    list_items(@items, Movie, 'movie')
  end

  def list_all_games
    list_items(@items, Game, 'game')
  end

  def display_items(items, title, item_properties)
    items_found = items.length.positive?
    if items_found
      puts "List of all #{title} in the catalog:"
      puts '-------------------------------------'
      count = 1
      items.each do |item|
        puts "#{count}). #{item_properties.call(item)}"
        count += 1
      end
    else
      puts "No #{title.downcase} found"
    end
    puts "No #{title.downcase} found" unless items_found
  end

  def list_all_genres
    display_items(
      @genres,
      'Genres',
      ->(genre) { "ID: #{genre.id}, Name: #{genre.name}" }
    )
  end

  def list_all_authors
    display_items(
      authors,
      'Authors',
      ->(author) { "ID: #{author.id}, Name: #{author.first_name} #{author.last_name}" }
    )
  end

  def list_all_labels
    display_items(
      @labels,
      'Labels',
      ->(label) { "ID: #{label.id}, Title: #{label.title}, Color: #{label.color}" }
    )
  end

  def list_all_sources
    display_items(
      @sources,
      'Sources',
      ->(source) { "ID: #{source.id}, Name: #{source.name}" }
    )
  end

  def add_a_book
    @app_helper.add_a_book
  end

  def add_a_music_album
    @app_helper.add_a_music_album
  end

  def add_a_movie
    @app_helper.add_a_movie
  end

  def add_a_game
    @app_helper.add_a_game
  end

  def save_all_data
    @file_saver.save_all_genres if @genres.length.positive?
    @file_saver.save_all_labels if @labels.length.positive?
    @file_saver.save_all_authors if @authors.length.positive?
    @file_saver.save_all_sources if @sources.length.positive?
    @file_saver.save_all_items if @items.length.positive?
  end
end
