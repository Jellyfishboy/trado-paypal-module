module TradoPaypalModule
    module ActiveRecord
        extend ActiveSupport::Concern

        module ClassMethods
            def has_order_paypal
                scope :paypal, -> { completed_collection.where(transactions: { payment_type: 'express-checkout' }) }

                def paypal?
                    payment_type == 'paypal' ? true : false
                end
            end

            def has_transation_paypal
                attr_accessible :paypal_id
            end

            def has_store_setting_paypal
                attr_accessible :paypal_currency_code

                validates :paypal_currency_code, presence: true
            end
        end
    end
end