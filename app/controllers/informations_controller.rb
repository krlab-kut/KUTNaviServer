class InformationsController < ApplicationController

def index
  #uuidを元にInformationのdbからデータを取り出し代入
  @information = Information.find(uuid)
end

end
