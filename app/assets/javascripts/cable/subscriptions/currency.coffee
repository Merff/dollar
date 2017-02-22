App.cable.subscriptions.create { channel: "CurrencyChannel" },
  received: (data) ->
    $('#dollar-value').text(data.value)
