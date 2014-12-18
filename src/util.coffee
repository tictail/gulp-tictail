module.exports =
  priceToMajor: (amount, currency) ->
    digits = currency.toLowerCase() == 'jpy' ? 0 : 2
    amount / Math.pow 10, digits
