class AddPaypalAttributes < ActiveRecord::Migration
    def self.up
        add_column :store_settings, :paypal_currency_code, :string, default: 'GBP'
        add_column :transactions, :paypal_id, :string
    end

    def self.down
        remove_column :store_settings, :paypal_currency_code
        remove_column :transactions, :paypal_id
    end
end
