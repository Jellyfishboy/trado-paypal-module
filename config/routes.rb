TradoPaypalModule::Engine.routes.draw do
    post 'ipn', to: 'trado_paypal_module/ipn#update', as: 'paypal_ipn'
end