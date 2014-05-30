class WorldcupController < ApplicationController

  def root
    @title = 'World Cup 2014'
    @description = 'The 2014 world cup is upon us and Mark.My is here to help you settle the score with your friends.'
    if params[:team].present?
      redirect_to blurbs_path(text: SENTENCES.sample % params[:team], mood: 'world-cup')
    end
  end
  
  def all_teams
    ['Algeria', 'Argentina', 'Australia', 'Belgium', 'Bosnia and Herzegovina', 'Brazil', 'Cameroon', 'Chile', 'Colombia', 'Costa Rica', 'Croatia', 'Côte d\'Ivoire', 'Ecuador', 'England', 'France', 'Germany', 'Ghana', 'Greece', 'Honduras', 'Iran', 'Italy', 'Japan', 'Korea Republic', 'Mexico', 'Netherlands', 'Nigeria', 'Portugal', 'Russia', 'Spain', 'Switzerland', 'USA', 'Uruguay']
  end
  helper_method :all_teams

  SENTENCES = [
      '%s is definitely taking the world cup',
      '%s will win the World Cup 2014',
      '%s will easily win cup',
  ]

end