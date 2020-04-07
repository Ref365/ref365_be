require 'factory_bot_rails'

Event.destroy_all
User.destroy_all

main_user = FactoryBot.create(:user)
FactoryBot.create_list(:event, 5, user: main_user)
