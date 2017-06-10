class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end
  def show
    @poems = Poem.all
  end
end