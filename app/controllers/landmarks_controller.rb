class LandmarksController < ApplicationController
  
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end 
  
  get '/landmarks/new' do 
    erb :"/landmarks/new"
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(params)
    erb :"/landmarks/show"
  end 
  
   get '/landmarks/:id/edit' do 
    @landmark = Landmark.find_by(params)
    erb :"/landmarks/edit"
  end 
  
   patch '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end 
    
  
  
end
