FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#sluggish_octopus. Therefore a O( n^2 ) Will go through the array twice
def quadratic_search(arr)
  arr.each_with_index do |fish1, i1|
    max_length = true
    arr.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end

end
p "quadratic"
p quadratic_search(FISH)


#notice how this is actually an nlogn search - all mergesort, quicksorts are this way
def dominant_octopus(arr)
  return arr if arr.length < 2
  pivot = arr[0]

  left = arr[1..-1].select{|fish| fish.length < pivot.length}
  right = arr[1..-1].select{|fish| fish.length >= pivot.length}

  left_sorted = dominant_octopus(left)
  right_sorted = dominant_octopus(right)

  new_arr = left_sorted + [pivot] + right_sorted
end

p "nlogn"
p dominant_octopus(FISH).last

#since this only steps into the array once. It is a linear search, which is n this if faster than n log n times
def linear_biggest_fish
  biggest = FISH[0]
  FISH.each_with_index do |fish, i|
    if fish.length >= biggest.length
      biggest = fish
    end
  end
  biggest
end

p "n"
p linear_biggest_fish

# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

# constant octopus dance
#use a hash for constant lookup
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
