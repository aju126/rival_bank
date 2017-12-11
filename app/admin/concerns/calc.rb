module Calc
  extend ActiveSupport::Concern

  # Returns computed value using the equation A = P( 1 + r/n)pow nt
  #
  # params - p : principal Amount
  #          r : interest in percent per annum
  #          t : deposit years in months
  #          n : payout period
  #
  #
  # Examples
  #
  #
  #  calculate_interest(1000, 4, 12, 12)
  #  returns : computed value

  def calculate_interest(p, r, t, n)
    t = t > 12 ? t/12 : 1
    x = (1 + (r.to_f/100)/ n)
    p * (x**(n*t))
  end

end