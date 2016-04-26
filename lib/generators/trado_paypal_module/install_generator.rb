module TradoPaypalModule
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path("../../templates", __FILE__)

			def copy_migration
				unless paypal_migration_already_exists?
					timestamp_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
					copy_file "migration.rb", "db/migrate/#{timestamp_number}_add_paypal_attributes.rb"
				end
			end

			def copy_helper
				template "helper.rb", "app/helpers/paypal_helper.rb"
			end

			def assign_model_concerns
				order_content = <<-CONTENT
					has_order_paypal
				CONTENT
				transaction_content = <<-CONTENT
					has_transaction_paypal
				CONTENT
				store_setting_content = <<-CONTENT
					has_store_setting_paypal
				CONTENT

				inject_into_file "app/models/order.rb", order_content, after: "class Order < ActiveRecord::Base"
				inject_into_file "app/models/transaction.rb", transaction_content, after: "class Transaction < ActiveRecord::Base"
				inject_into_file "app/models/store_setting.rb", store_setting_content, after: "class StoreSetting < ActiveRecord::Base"
			end

			def setup_env_configs
				development_content = <<-CONTENT
					# PayPal settings
					config.after_initialize do
					    ActiveMerchant::Billing::Base.mode = :test
					    paypal_options = {
					      login: Rails.application.secrets.paypal_login,
					      password: Rails.application.secrets.paypal_password,
					      signature: Rails.application.secrets.paypal_signature
					    }
					    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
					  end
				CONTENT

				test_content = <<-CONTENT
					# PayPal settings
					config.after_initialize do
					    ActiveMerchant::Billing::Base.mode = :test
					    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::BogusGateway.new
					  end
				CONTENT

				production_content = <<-CONTENT
					# PayPal settings
					config.after_initialize do
					    paypal_options = {
					      login: Rails.application.secrets.paypal_login,
					      password: Rails.application.secrets.paypal_password,
					      signature: Rails.application.secrets.paypal_signature
					    }
					    ::EXPRESS_GATEWAY = ActiveMerchant::Billing::PaypalExpressGateway.new(paypal_options)
					  end
				CONTENT
				inject_into_file "config/environments/development.rb", development_content, after: "Trado::Application.configure do"
				inject_into_file "config/environments/test.rb", test_content, after: "Trado::Application.configure do"
				inject_into_file "config/environments/production.rb", production_content, after: "Trado::Application.configure do"
			end

			private

			def paypal_migration_already_exists?
				Dir.glob("#{File.join(destination_root, File.join("db", "migrate"))}/[0-9]*_*.rb").grep(/\d+_add_paypal_attributes.rb$/).first
			end
		end
	end
end