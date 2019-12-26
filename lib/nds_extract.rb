$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  dir_index = 0
  list = []
  while dir_index < source.size do
    list << source[dir_index][:name] 
    dir_index += 1
  end
  return list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the
  # hash returned by directors_totals, and add it to a running
  # total. When done, return the grand total

  result = directors_totals(source)
  names = list_of_directors(source)
  grand_total = 0
  index = 0
  while index < result.length do
    grand_total += result[names[index]]
    index += 1
  end
  return grand_total
end


