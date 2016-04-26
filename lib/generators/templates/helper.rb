module PaypalHelper

    def paypal_form_tag
        raw("<div class='paypal-form-wrapper'>#{image_tag('paypal-icon.png')}#{radio_button_tag(:payment_type, 'paypal' checked: checked)}</div>")
    end
end