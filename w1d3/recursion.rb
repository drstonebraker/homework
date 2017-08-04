def sum_to(n)
  return nil if n <= 0
  n + sum_to(n-1).to_i
end

def add_numbers(arr)
  num = arr.pop
  return num if arr.empty?
  num + add_numbers(arr)
end

def gamma_fnc(n)
  return nil if n.zero?
  return 1 if n == 1
  n.pred * gamma_fnc(n.pred)
end

def ice_cream_shop(flavors, favorite)
  return true if flavors.pop == favorite
  return false if flavors.empty?
  ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0..-2])
end
