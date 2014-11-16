class WifiRating < ActiveRecord::Base
  enum quality: { text: 1, pics: 2, gifs: 3, streaming: 4 }
end
