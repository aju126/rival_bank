
ActiveAdmin.register_page 'Interest Calculator' do

  menu parent: 'Operations'

  content do
    panel '' do
      render 'interest'
    end
  end

  controller do
    def calculate
      @principal = params[:principal_amount]
      @interest = params[:interest_rate]
      @duration = params[:duration]
      @payout = 'Monthly'
      payout = @duration.to_i < 12 ? @duration.to_i : 12
      @total = calculate_interest(@principal.to_i, @interest.to_i, @duration.to_i, payout)
      render :calculate
    end

     def calculate_interest(p, r, t, n)
       t = t > 12 ? t/12 : 1
       x = (1 + (r.to_f/100)/ n)
       p * (x**(n*t))
     end
  end
end