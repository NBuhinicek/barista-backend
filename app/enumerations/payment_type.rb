class PaymentType < Enumerations::Base
  value :cash,
        name: 'Cash'
  value :credit_card,
        name: 'Credit card'
  # TODO: one day maybe paypal
  # value :paypal,
  #       name: 'Paypal'
end
