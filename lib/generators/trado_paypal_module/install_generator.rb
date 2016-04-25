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

			private

			def paypal_migration_already_exists?
				Dir.glob("#{File.join(destination_root, File.join("db", "migrate"))}/[0-9]*_*.rb").grep(/\d+_add_paypal_attributes.rb$/).first
			end
		end
	end
end