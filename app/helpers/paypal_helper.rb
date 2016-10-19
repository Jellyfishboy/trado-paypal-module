module PaypalHelper

    def paypal_checkout_fields f
        render "themes/#{Store.settings.theme.name}/carts/paypal_checkout_fields", format: [:html], f: f
    rescue ActionView::MissingTemplate
        render 'carts/paypal_checkout_fields', format: [:html], f: f
    end
end