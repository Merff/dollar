every :hour do
  runner "GetDollarService.execute"
end

every 1.minute do
  runner "Dollar.instance.broadcast_to_currency_chanel"
end
