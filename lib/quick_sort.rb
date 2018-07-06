require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    pivot_idx = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, length - pivot_idx - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    return if length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    barrier = start

    (start + 1..(start + length - 1)).each do |idx|
      if prc.call(array[start], array[idx]) == 1
        array[barrier + 1], array[idx] = array[idx], array[barrier + 1]
        barrier += 1
      end
    end
    
    array[start], array[barrier] = array[barrier], array[start]
    barrier
  end

  def getRandom(num)
    rand(num)
  end  
end
