class AddPaypalAttributes < ActiveRecord::Migration
    def self.up
        add_column :store_settings, :paypal_currency_code, :string, default: 'GBP'
        add_column :transactions, :paypal_id, :string
        add_column :orders, :paypal_express_token, :string
        add_column :orders, :paypal_express_payer_id, :string
    end

    def self.down
        remove_column :store_settings, :paypal_currency_code
        remove_column :transactions, :paypal_id
        remove_column :orders, :paypal_express_token
        remove_column :orders, :paypal_express_payer_id
    end
end
