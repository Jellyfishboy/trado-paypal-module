class TradoPaypalModule::PaypalController < ApplicationController
    skip_before_action :authenticate_user!
    include CartBuilder

    def confirm
        set_order
        set_cart_totals
        set_grouped_countries
        set_browser_data
        @order.attributes = params[:order]
        if @order.save
            @order.calculate(current_cart, Store.tax_rate)
            generate_payment_url
            if @redirect_url.nil?
                flash_message :error, 'An error ocurred with your order. Please try again.'
                Rails.logger.error "PayPal: Unable to generate redirect URL."
                redirect_to checkout_carts_url
            else
                redirect_to @redirect_url
            end
        else
            flash_message :error, 'An error ocurred with your order. Please try again.'
            render theme_presenter.page_template_path('carts/checkout'), layout: theme_presenter.layout_template_path
        end
    rescue ActiveMerchant::ConnectionError
        flash_message :error, 'An error ocurred with your order. Please try again.'  
        Rails.logger.error "PayPal: API is temporarily unavailable."
        redirect_to checkout_carts_url
    end

    private

    def generate_payment_url
        @redirect_url = Store::PayProvider.new(cart: current_cart, order: @order, provider: @order.payment_type, ip_address: request.remote_ip).build
    end
end