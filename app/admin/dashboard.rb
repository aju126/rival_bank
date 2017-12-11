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
        panel "Personal Details" do
          div do
            para "Account Number: #{ current_user_account.account_number }"
          end
          div do
            para "User Name: #{ current_user_account.user_name }"
          end
          div do
            para "Name: #{ current_user_account.user_information.name }"
          end
          div do
            para "Phone: #{ current_user_account.user_information.phone }"
          end
          div do
            para "Email: #{ current_user_account.user_information.email }"
          end
        end
      end
    end # columns

    columns do
      column do
        panel "Recent Transactions" do
          table_for Transaction.mine(current_user_account).order("id desc").limit(10) do
            column("Action") { |order| status_tag(order.action.name) }
            column("From") { |order| order.destination_account }
            column("Total")   { |order| order.amount }
          end
        end
      end
    end

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
