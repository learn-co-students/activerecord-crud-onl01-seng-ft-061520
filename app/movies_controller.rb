# Replace the '__' in the below methods to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right:
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end


## NOTE: Double # shows original code prior to solving
## NOTE reference ActiveRecord Basics:    https://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data

def can_be_instantiated_and_then_saved
  ## movie = __
  ## movie.title = "This is a title."
  ## __

  movie = Movie.new
  movie.title = "This is a title."
  movie.save

end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  ## movie = __

  movie = Movie.create(attributes)
  # NOTE: attributes is the given name of the hash
end

## def can_be_created_in_a_block(args = __)
def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990})
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990
  
  Movie.create do |m|
    ## __

    m.title = args[:title]
    m.release_date = args[:release_date]
    m.save
  end
end

def can_get_the_first_item_in_the_database
  ## __

  Movie.find(1)
  # SOLUTION: Movie.first
  # NOTE: Learn.co lesson ActiveRecord Mechanics
end

def can_get_the_last_item_in_the_database
  ## __

  Movie.last
end

def can_get_size_of_the_database
  ## __

  Movie.all.length
  # SOLUTION: Movie.count

end

def can_find_the_first_item_from_the_database_using_id
  ## __

  Movie.find(1)
  # SOLUTION: Movie.find_by(id:1)
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
 ## __

  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  ## __

  Movie.where("release_date > 2002").order(release_date: :desc)
end

def can_be_found_updated_and_saved
  # Update the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  ## __
  ## __
  ## __

  movie = Movie.find_by(title: 'Awesome Flick')
  movie.title = 'Even Awesomer Flick'
  movie.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  ## __
  ## __

  movie = Movie.find_by(title: 'Wat?')
  movie.update(title: 'Wat, huh?')
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|

    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  ## __

  5.times do |i|
    movie = Movie.find_by(title: "Movie_#{i}")
    movie.update(title: "A Movie")
  end

  # SOLUTION:   Movie.all.each{|movie| movie.update(title: "A Movie")}

end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  ## __
  ## __

  movie = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  movie.delete
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  ## __

  Movie.all.delete_all
end