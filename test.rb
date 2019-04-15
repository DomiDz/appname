collection = [2, 7, 9]

logger.debug "iterating over a collection of #{collection.count} items"
collection.each do |item|
  logger.debug "Item before increment: #{item}"
  item += 1
  logger.debug "Item after increment #{item}"
end
logger.debug "done iterating!"