module.exports =
  priceToMajor: (amount, currency) ->
    digits = if currency.toLowerCase() == 'jpy' then 0 else 2
    amount / Math.pow 10, digits
