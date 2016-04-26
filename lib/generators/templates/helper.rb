module PaypalHelper

    def paypal_form_tag
        "<div>#{image_tag('paypal-icon.png')}</div>
        #{radio_button_tag(:payment_type, 'express-checkout', checked: true)}"
    end
end