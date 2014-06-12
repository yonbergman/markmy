class WorldcupController < ApplicationController

  def root
    @title = 'World Cup 2014'
    @description = 'The 2014 World Cup has started and "Mark.my - the ultimate predictions platform" is here to help you tell your friends "I told you so!".'
    if params[:team].present?
      redirect_to blurbs_path(text: SENTENCES.sample % params[:team], mood: 'world-cup')
    end
  end
  
  def all_teams
    ['Algeria', 'Argentina', 'Australia', 'Belgium', 'Bosnia and Herzegovina', 'Brazil', 'Cameroon', 'Chile', 'Colombia', 'Costa Rica', 'Croatia', 'Côte d\'Ivoire', 'Ecuador', 'England', 'France', 'Germany', 'Ghana', 'Greece', 'Honduras', 'Iran', 'Italy', 'Japan', 'Korea Republic', 'Mexico', 'Netherlands', 'Nigeria', 'Portugal', 'Russia', 'Spain', 'Switzerland', 'USA', 'Uruguay']
  end
  helper_method :all_teams

  SENTENCES = [
      '%s is definitely taking the World Cup',
      '%s will win the World Cup 2014',
      '%s will easily win the cup',
      '%s will easily win the cup',
      '%s will make it to the finals... and win!',
  ]

end