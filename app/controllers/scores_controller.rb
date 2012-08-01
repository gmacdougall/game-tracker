class ScoresController < ApplicationController
  load_and_authorize_resource
  # GET /scores/new
  # GET /scores/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @score }
    end
  end

  # GET /scores/1/edit
  def edit
    @instances = Instance.includes(:game).all
  end

  # POST /scores
  # POST /scores.json
  def create
    respond_to do |format|
      if @score.save
        format.html { redirect_to @score, notice: 'Score was successfully created.' }
        format.json { render json: @score, status: :created, location: @score }
      else
        format.html { render action: "new" }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scores/1
  # PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update_attributes(params[:score])
        format.html { redirect_to @score, notice: 'Score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url }
      format.json { head :no_content }
    end
  end
end
