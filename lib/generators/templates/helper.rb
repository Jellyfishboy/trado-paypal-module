module PaypalHelper

    def paypal_form_tag
        raw("<div class='paypal-form-wrapper'>#{radio_button_tag(:payment_type, 'paypal', checked: true)}#{image_tag('paypal-icon.png')}</div>")
    end
end