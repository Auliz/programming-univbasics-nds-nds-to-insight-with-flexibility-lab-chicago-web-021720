# Provided, don't edit
require 'directors_database'
require 'pp'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# Your code after this point

def movies_with_director_key(name, movies_collection)
  new_movies_arr = []
  i = 0 
  while i < movies_collection.length do 
    new_movies_arr << movie_with_director_name(name, movies_collection[i])
    i += 1 
  end 
  new_movies_arr
end

def gross_per_studio(collection)
  result = {}
  i = 0 
  while i < collection.length do 
    
    movie_title = collection[i][:title]
    movie_studio = collection[i][:studio]
    movie_gross = collection[i][:worldwide_gross]

    if result[movie_studio] == nil
      result[movie_studio] =  0  
      result[movie_studio] += movie_gross 
      elsif 
        result[movie_studio] += movie_gross
    end 
    i += 1
  end 
  result
end 

def movies_with_directors_set(source)
  i = 0
  result = []
  #binding.pry
  while i < source.length do 
    name = source[i][:name]
    temp = source[i][:movies]                
    n = 0
    while n < temp.length do
      dir_name = temp[n][:director_name]
      result << [dir_name = name]
      n += 1 
      binding.pry
    end 
    i += 1
  end 
  #pp source
  binding.pry
end 

# [{:name=>"Byron Poodle",sInName>)> source
#   :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
# {:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]

# becomes... [[{:title => "Test", :director_name => "A"}], ...[], ... []]

#   [[{"Byron Poodle"=>"At the park"}, {"Byron Poodle"=>"On the couch"}],
# [{"Nancy Drew"=>"Biting"}]]
 
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
