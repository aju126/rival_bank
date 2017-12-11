ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Your Account Balance" do
          div do
            para "Current Balance: #{ current_user_account.balance }"
          end
        end
      end
      column do
        panel "Recent Transactions" do
          table_for Transaction.mine(current_user_account).order("id desc").limit(10) do
            column("Action") { |order| status_tag(order.action.name) }
            column("From") { |order| order.destination_account }
            column("Total")   { |order| order.amount }
          end
        end
      end

      # column do
      #   panel "Recent Customers" do
      #     table_for User.order("id desc").limit(10).each do |_user|
      #       column(:email)    { |user| link_to(user.email, admin_user_path(user)) }
      #     end
      #   end
      # end
    end # columns

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
