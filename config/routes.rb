TradoPaypalModule::Engine.routes.draw do
    scope '/paypal' do
        post 'ipn', to: 'trado_paypal_module/ipn#update', as: 'paypal_ipn'
    end
end