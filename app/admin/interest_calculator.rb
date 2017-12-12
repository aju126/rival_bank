
ActiveAdmin.register_page 'Interest Calculator' do

  menu parent: 'Operations'

  content do
    panel '' do
      render 'interest'
    end
  end

  controller do

   # include Calc

    def calculate
      @principal = params[:principal_amount]
      @interest = params[:interest_rate]
      @duration = params[:duration]
      @payout = 'Monthly'
      payout = @duration.to_i < 12 ? @duration.to_i : 12
      #@total = calculate_interest(@principal.to_i, @interest.to_i, @duration.to_i, payout)
      render :calculate
    end
  end
end