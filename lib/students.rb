class Students
  def all
    [
      {name: "Bob", age: 10},
      {name: "Sue", age: 10},
      {name: "Greg", age: 15},
      {name: "Amanda", age: 8},
      {name: "Steve", age: 22},
    ]
  end

  def all_ages
    ages_array = []
    all.each do |student|
      ages_array << student[:age]
    end
    ages_array
  end

  def average_age
    all_ages.inject(:+)/all_ages.length
  end

  def name_string
    names = []
    all.each do |student|
      names << student[:name]
    end
    names.join(' ')
  end

  def find_first_older_than(age)
    all.each do |student|
      return student if student[:age] > age
    end
  end

  def any_older_than?(age)
    all_ages.any? {|x| x > age }
  end

  def find_student(hash)
    all.select do |student|
      if student[:name] == hash[:name] && student[:age] == hash[:age]
        return student
      end
    end
    return nil if all == []
  end

  def student_present?(hash)
    all.include?(hash)
  end

  def grouped_by_age
    grouped_hash = all.group_by {|student| student[:age]}
    group = {}
      grouped_hash.each do |key, value|
        group[key] = value.map {|student| student[:name]}
      end
    group
  end

end