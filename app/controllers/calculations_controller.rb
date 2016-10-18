class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

    @word_count = @text.lines(" ").count

    @occurrences = (@text).scan(@special_word).count

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    monthly_interest_rate = @apr/12/100
    n_payments = @years*12
    @monthly_payment = (monthly_interest_rate * @principal *(1+monthly_interest_rate)**n_payments)/((1+monthly_interest_rate)**n_payments -1)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    interval = @ending - @starting

    year_sec = 365 * 24 * 60 * 60
    weeks_sec = 7 * 24 * 60 * 60
    days_sec = 24 * 60 * 60
    hours_sec = 60 * 60
    min_sec = 60

    # @years = (interval / year_sec).floor
    # remainder = interval - @years*year_sec
    # @weeks = (remainder / weeks_sec).floor
    # remainder = remainder - @weeks*weeks_sec
    # @days = (remainder / days_sec).floor
    # remainder = remainder - @days*days_sec
    # @hours = (remainder / hours_sec).floor
    # remainder = remainder - @hours*hours_sec
    # @minutes = (remainder / min_sec).floor
    # remainder = remainder - @minutes*min_sec
    # @seconds = remainder.to_f

    @years = (interval / year_sec)
    @weeks = (interval / weeks_sec)
    @days = (interval / days_sec)
    @hours = (interval / hours_sec)
    @minutes = (interval / min_sec)
    @seconds = interval

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    def median(my_array)
      while
        my_array.length > 2
        my_array = my_array[1..(my_array.length-2)]
      end
      return(my_array.sum/my_array.count)
    end

    @median = median(@sorted_numbers)

    @sum = @numbers.sum

    @mean = @sum / @count

    def variance(my_array)
      sqrdiff=[]
        @numbers.each do |elem|
          sqrdiff.push((elem-@mean)**2)
        end
        return sqrdiff.sum / sqrdiff.count
    end

    @variance = variance(@numbers)

    @standard_deviation = Math.sqrt(@variance)

    def mode(my_array)
      unique_elements = my_array.uniq
      unique_elements.each do |elem|
        #my_array = my_array.delete_at(my_array.rindex{|x| x==elem})
      end
    end

    @mode = mode(@numbers)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
