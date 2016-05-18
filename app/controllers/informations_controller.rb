class InformationsController < ApplicationController

def index
  #uuidを元にInformationのdbからデータを取り出し代入
  #@information = Information.find(uuid)

  #uuidを元にUserのdbからデータを取り出し代入
  user = User.where(uuid)
  #idを元にInformationのdbからデータを取り出し代入
  @information = Information.where(user.id)
end

end
