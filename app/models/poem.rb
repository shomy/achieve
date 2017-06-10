class Poem < ActiveResource::Base #ActiveRecord::Baseから変更する
  self.site = "https://poepoes.herokuapp.com"
end
