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

    @occurrences = @text.scan(@special_word).count

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

    @seconds = "Replace this string with your answer."
    @minutes = "Replace this string with your answer."
    @hours = "Replace this string with your answer."
    @days = "Replace this string with your answer."
    @weeks = "Replace this string with your answer."
    @years = "Replace this string with your answer."

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

    end

    @median = "Replace this string with your answer."

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

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
