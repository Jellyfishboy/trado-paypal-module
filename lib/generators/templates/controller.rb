class Carts::PaypalController < ApplicationController
    skip_before_action :authenticate_user!
    include CartBuilder

    def confirm
        set_order
        set_cart_totals
        set_cart_session
        set_delivery_services
        set_grouped_countries
        @order.attributes = params[:order]
        session[:payment_type] = params[:payment_type]
        if @order.save
            @order.calculate(current_cart, Store.tax_rate)
            @order.transfer(current_cart)
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

    def set_grouped_countries
        @grouped_countries = [Country.popular.map{ |country| [country.name, country.name] }, Country.all.order('name ASC').map{ |country| [country.name, country.name] }] 
    end
end