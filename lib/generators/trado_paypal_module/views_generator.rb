module TradoPaypalModule
    module Generators
        class ViewsGenerator < Rails::Generators::Base
            source_root File.expand_path("../../../../app/views", __FILE__)

            def copy_views
                copy_file 'carts/_paypal_checkout_fields.html.erb', "app/views/themes/#{Store.settings.theme.name}/carts/_paypal_checkout_fields.html.erb"
                puts "Copied to your #{Store.settings.theme.name} theme!"
            end
        end
    end
end