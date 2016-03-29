TradoPaypalModule::Engine.routes.draw do
    scope '/paypal' do
        post 'ipn' => 'trado_paypal_module/ipn#update'
    end
end